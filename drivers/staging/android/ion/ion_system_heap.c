// SPDX-License-Identifier: GPL-2.0
/*
 * drivers/staging/android/ion/ion_system_heap.c
 *
 * Copyright (C) 2011 Google, Inc.
 * Copyright (c) 2011-2020, The Linux Foundation. All rights reserved.
 *
 */

#include <asm/page.h>
#include <linux/dma-mapping.h>
#include <linux/err.h>
#include <linux/highmem.h>
#include <linux/mm.h>
#include <linux/scatterlist.h>
#include <linux/seq_file.h>
#include <linux/slab.h>
#include <linux/vmalloc.h>
#include <linux/sched/cputime.h>
#include <linux/sched/types.h>
#include <linux/sched.h>
#include <soc/qcom/secure_buffer.h>
#include <linux/kobject.h>
#include <linux/gfp.h>
#include "ion_system_heap.h"
#include "ion.h"
#include "ion_system_secure_heap.h"
#include "ion_secure_util.h"

#define MAX_WATER_MARK (SZ_1M * 400) /* 400MB */
#define DEFAULT_PREFILL_LOW_PERCENT 40UL
#define DEFAULT_PREFILL_HIGH_PERCENT 100UL
#define DEFAULT_ALLOC_WARN_TIME_THRESH 6000
#define MAX_POOL_PREFILL_PERCENT 500
#define ION_ALLOC_TIME_THRESH_4MS 4000
#define ION_ALLOC_TIME_THRESH_6MS 6000
#define ION_ALLOC_TIME_THRESH_8MS 8000
#define ION_ALLOC_TIME_THRESH_11MS 11000
#define ION_ALLOC_TIME_THRESH_16MS 16000
#define ION_ALLOC_PAGE_THRESH 32

static struct ion_system_heap *ion_sys_heap;
static struct ion_system_heap_stats ion_alloc_stats;

static int fill_pool_once(struct ion_page_pool *pool)
{
	struct page *page = NULL;
        page = alloc_pages(pool->gfp_mask, pool->order);
	if (!page)
		return -ENOMEM;
	ion_page_pool_free(pool, page);

	return 0;
}

static void fill_pool_watermark(struct ion_page_pool **pools,
				unsigned long watermark)
{
	unsigned int i;
	unsigned long count;

	for (i = 0; i < NUM_ORDERS; i++) {
		while (watermark) {
			if (fill_pool_once(pools[i]))
				break;

			count = 1UL << pools[i]->order;
			if (watermark >= count)
				watermark -= count;
			else
				watermark = 0;
		}
	}
}

static inline bool is_ion_pool_type_valid(enum ion_pool_type type)
{
	return (type >= ION_POOL_UNCACHED && type < ION_MAX_NUM_POOLS);
}

static void ion_sys_pool_wakeup(enum ion_pool_type type)
{
	struct ion_pool_prefetch_ctrl *ctrl = NULL;
	struct ion_system_heap *heap = ion_sys_heap;
	if (!is_ion_pool_type_valid(type))
		return;
	ctrl = &heap->prefetch_ctrls[type];
	atomic_set(&ctrl->wait_flag, 1);
	wake_up_interruptible(&ctrl->pool_watermark_wait);
}

void set_sys_pool_watermark(enum ion_pool_type type, unsigned long watermark)
{
	struct ion_system_heap *heap = ion_sys_heap;
	struct ion_pool_prefetch_ctrl *ctrl = NULL;

	if (!is_ion_pool_type_valid(type))
		return;
	ctrl = &heap->prefetch_ctrls[type];
	if (!watermark)
		return;

	if (!wq_has_sleeper(&ctrl->pool_watermark_wait))
		return;

	mutex_lock(&ctrl->pool_watermark_lock);
	ctrl->pool_watermark = watermark / PAGE_SIZE;
	mutex_unlock(&ctrl->pool_watermark_lock);

	ion_sys_pool_wakeup(type);
}

static gfp_t high_order_gfp_flags = (GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN |
				     __GFP_NORETRY) & ~__GFP_RECLAIM;
static gfp_t low_order_gfp_flags  = GFP_HIGHUSER | __GFP_ZERO;

bool pool_auto_refill_en  __read_mostly =
		IS_ENABLED(CONFIG_ION_POOL_AUTO_REFILL);

int order_to_index(unsigned int order)
{
	int i;

	for (i = 0; i < NUM_ORDERS; i++)
		if (order == orders[i])
			return i;
	BUG();
	return -1;
}

static inline unsigned int order_to_size(int order)
{
	return PAGE_SIZE << order;
}

struct pages_mem {
	struct page **pages;
	u32 size;
};

int ion_heap_is_system_heap_type(enum ion_heap_type type)
{
	return type == ((enum ion_heap_type)ION_HEAP_TYPE_SYSTEM);
}

static struct page *alloc_buffer_page(struct ion_system_heap *heap,
				      struct ion_buffer *buffer,
				      unsigned long order,
				      bool *from_pool)
{
	int cached = (int)ion_buffer_cached(buffer);
	struct page *page;
	struct ion_page_pool *pool;
	int vmid = get_secure_vmid(buffer->flags);
	struct device *dev = heap->heap.priv;

	if (vmid > 0)
		pool = heap->secure_pools[vmid][order_to_index(order)];
	else if (!cached)
		pool = heap->uncached_pools[order_to_index(order)];
	else
		pool = heap->cached_pools[order_to_index(order)];

	page = ion_page_pool_alloc(pool, from_pool);

	if (pool_auto_refill_en && pool->order &&
	    pool_count_below_lowmark(pool) && vmid <= 0) {
		wake_up_process(heap->kworker[cached]);
	}

	if (IS_ERR(page))
		return page;

	if ((MAKE_ION_ALLOC_DMA_READY && vmid <= 0) || !(*from_pool))
		ion_pages_sync_for_device(dev, page, PAGE_SIZE << order,
					  DMA_BIDIRECTIONAL);

	return page;
}

/*
 * For secure pages that need to be freed and not added back to the pool; the
 *  hyp_unassign should be called before calling this function
 */
void free_buffer_page(struct ion_system_heap *heap,
		      struct ion_buffer *buffer, struct page *page,
		      unsigned int order)
{
	bool cached = ion_buffer_cached(buffer);
	int vmid = get_secure_vmid(buffer->flags);

	if (!(buffer->flags & ION_FLAG_POOL_FORCE_ALLOC)) {
		struct ion_page_pool *pool;

		if (vmid > 0)
			pool = heap->secure_pools[vmid][order_to_index(order)];
		else if (cached)
			pool = heap->cached_pools[order_to_index(order)];
		else
			pool = heap->uncached_pools[order_to_index(order)];

		if (buffer->private_flags & ION_PRIV_FLAG_SHRINKER_FREE)
			ion_page_pool_free_immediate(pool, page);
		else
			ion_page_pool_free(pool, page);

		mod_node_page_state(page_pgdat(page), NR_UNRECLAIMABLE_PAGES,
				    -(1 << pool->order));
	} else {
		__free_pages(page, order);
		mod_node_page_state(page_pgdat(page), NR_UNRECLAIMABLE_PAGES,
				    -(1 << order));
	}
}

static struct page_info *alloc_largest_available(struct ion_system_heap *heap,
						 struct ion_buffer *buffer,
						 unsigned long size,
						 unsigned int max_order)
{
	struct page *page;
	struct page_info *info;
	int i;
	bool from_pool;

	info = kmalloc(sizeof(*info), GFP_KERNEL);
	if (!info)
		return ERR_PTR(-ENOMEM);

	for (i = 0; i < NUM_ORDERS; i++) {
		if (size < order_to_size(orders[i]))
			continue;
		if (max_order < orders[i])
			continue;
		from_pool = !(buffer->flags & ION_FLAG_POOL_FORCE_ALLOC);
		page = alloc_buffer_page(heap, buffer, orders[i], &from_pool);
		if (IS_ERR(page))
			continue;

		info->page = page;
		info->order = orders[i];
		info->from_pool = from_pool;
		INIT_LIST_HEAD(&info->list);
		return info;
	}
	kfree(info);

	return ERR_PTR(-ENOMEM);
}

static void ion_system_heap_init_buffer_stats(struct ion_buffer *buffer)
{
#ifdef CONFIG_ION_WIDE_INFO
	int order_id;

	for (order_id = 0; order_id < NUM_ORDERS; order_id++)
		buffer->nr_pages_by_order[order_id] = 0;
#else
	(void) buffer;
#endif
}

static void ion_system_heap_update_buffer_stats(struct ion_buffer *buffer,
						int order, int nr)
{
#ifdef CONFIG_ION_WIDE_INFO
	buffer->nr_pages_by_order[order_to_index(order)] += nr;
#else
	(void) buffer;
	(void) order;
	(void) nr;
#endif
}

#ifdef CONFIG_ION_WIDE_INFO
static int ion_system_heap_get_heap_stats(struct ion_heap *heap,
					  struct ion_heap_stats *stats)
{
	int order_id;

	stats->nr_orders = min((int)NUM_ORDERS, ION_BUFFER_MAX_ORDERS);

	for (order_id = 0; order_id < stats->nr_orders; order_id++)
		stats->orders[order_id] = orders[NUM_ORDERS - 1 - order_id];

	spin_lock(&heap->stats_lock);
	stats->sz_allocated = heap->sz_allocated;
	stats->allocation_time = heap->allocation_time;
#ifdef CONFIG_ION_BUFFER_REUSE
	stats->sz_reused = heap->sz_reused;
	stats->reuse_time = heap->reuse_time;
#endif
	spin_unlock(&heap->stats_lock);

	return 0;
}

static int ion_system_heap_get_buffer_stats(struct ion_buffer *buffer,
					    struct ion_buffer_stats *stats)
{
	int order_id;

	stats->nr_orders = min((int)NUM_ORDERS, ION_BUFFER_MAX_ORDERS);

	for (order_id = 0; order_id < stats->nr_orders; order_id++) {
		stats->orders[order_id] = orders[NUM_ORDERS - 1 - order_id];
		stats->nr_pages[order_id] = buffer->nr_pages_by_order[NUM_ORDERS - 1 - order_id];
	}

	return 0;
}
#endif

static struct page_info *
alloc_from_pool_preferred(struct ion_system_heap *heap,
			  struct ion_buffer *buffer,
			  unsigned long size,
			  unsigned int max_order)
{
	struct page *page;
	struct page_info *info;
	int i;

	if (buffer->flags & ION_FLAG_POOL_FORCE_ALLOC)
		goto force_alloc;

	info = kmalloc(sizeof(*info), GFP_KERNEL);
	if (!info)
		return ERR_PTR(-ENOMEM);

	for (i = 0; i < NUM_ORDERS; i++) {
		if (size < order_to_size(orders[i]))
			continue;
		if (max_order < orders[i])
			continue;

		page = alloc_from_secure_pool_order(heap, buffer, orders[i]);
		if (IS_ERR(page))
			continue;

		info->page = page;
		info->order = orders[i];
		info->from_pool = true;
		INIT_LIST_HEAD(&info->list);
		return info;
	}

	page = split_page_from_secure_pool(heap, buffer);
	if (!IS_ERR(page)) {
		info->page = page;
		info->order = 0;
		info->from_pool = true;
		INIT_LIST_HEAD(&info->list);
		return info;
	}

	kfree(info);
force_alloc:
	return alloc_largest_available(heap, buffer, size, max_order);
}

static unsigned int process_info(struct page_info *info,
				 struct scatterlist *sg,
				 struct scatterlist *sg_sync,
				 struct pages_mem *data, unsigned int i)
{
	struct page *page = info->page;
	unsigned int j;

	if (sg_sync) {
		sg_set_page(sg_sync, page, (1 << info->order) * PAGE_SIZE, 0);
		sg_dma_address(sg_sync) = page_to_phys(page);
	}
	sg_set_page(sg, page, (1 << info->order) * PAGE_SIZE, 0);
	/*
	 * This is not correct - sg_dma_address needs a dma_addr_t
	 * that is valid for the the targeted device, but this works
	 * on the currently targeted hardware.
	 */
	sg_dma_address(sg) = page_to_phys(page);
	if (data) {
		for (j = 0; j < (1 << info->order); ++j)
			data->pages[i++] = nth_page(page, j);
	}
	list_del(&info->list);
	kfree(info);
	return i;
}

static int ion_heap_alloc_pages_mem(struct pages_mem *pages_mem)
{
	struct page **pages;
	unsigned int page_tbl_size;

	page_tbl_size = sizeof(struct page *) * (pages_mem->size >> PAGE_SHIFT);
	if (page_tbl_size > SZ_8K) {
		/*
		 * Do fallback to ensure we have a balance between
		 * performance and availability.
		 */
		pages = kmalloc(page_tbl_size,
				__GFP_COMP | __GFP_NORETRY |
				__GFP_NOWARN);
		if (!pages)
			pages = vmalloc(page_tbl_size);
	} else {
		pages = kmalloc(page_tbl_size, GFP_KERNEL);
	}

	if (!pages)
		return -ENOMEM;

	pages_mem->pages = pages;
	return 0;
}

static void ion_heap_free_pages_mem(struct pages_mem *pages_mem)
{
	kvfree(pages_mem->pages);
}

static void get_global_mem_wmarks(unsigned long *low, unsigned long *min,
				  unsigned long *free_pages)
{
	struct zonelist *zonelist;
	struct zoneref *z;
	struct zone *zone;
	unsigned long wmark_low = 0;
	unsigned long wmark_min = 0;
	unsigned long num_free = 0;
	enum zone_type classzone_idx = gfp_zone(low_order_gfp_flags);
	zonelist = node_zonelist(numa_node_id(), low_order_gfp_flags);

	for_each_zone_zonelist (zone, z, zonelist, classzone_idx) {
		wmark_low += low_wmark_pages(zone);
		wmark_min += min_wmark_pages(zone);
		num_free += zone_page_state(zone, NR_FREE_PAGES);
	}

	if (low)
		*low = wmark_low;

	if (min)
		*min = wmark_min;

	if (free_pages)
		*free_pages = num_free;
}

static void ion_alloc_stat(struct ion_system_heap_stats *stats,
			   unsigned long long alloc_time,
			   unsigned long from_pool_pages,
			   unsigned long from_buddy_pages)
{
	atomic64_inc(&stats->alloc_total_times);
	if (alloc_time >= ION_ALLOC_TIME_THRESH_16MS)
		atomic64_inc(&stats->stat_greater_16ms);
	else if (alloc_time >= ION_ALLOC_TIME_THRESH_11MS)
		atomic64_inc(&stats->stat_11to16ms);
	else if (alloc_time >= ION_ALLOC_TIME_THRESH_8MS)
		atomic64_inc(&stats->stat_8to11ms);
	else if (alloc_time >= ION_ALLOC_TIME_THRESH_6MS)
		atomic64_inc(&stats->stat_6to8ms);
	else if (alloc_time >= ION_ALLOC_TIME_THRESH_4MS)
		atomic64_inc(&stats->stat_4to6ms);
	else
		atomic64_inc(&stats->stat_less_4ms);
	if (from_buddy_pages <= ION_ALLOC_PAGE_THRESH)
		atomic64_inc(&stats->alloc_from_pool_total_times);
	else if (from_pool_pages <= ION_ALLOC_PAGE_THRESH)
		atomic64_inc(&stats->alloc_from_buddy_total_times);
	else
		atomic64_inc(&stats->alloc_from_pool_and_buddy_total_times);
}

static int ion_system_heap_allocate(struct ion_heap *heap,
				    struct ion_buffer *buffer,
				    unsigned long size,
				    unsigned long flags)
{
	struct ion_system_heap *sys_heap = container_of(heap,
							struct ion_system_heap,
							heap);
	struct sg_table *table;
	struct sg_table table_sync = {0};
	struct scatterlist *sg;
	struct scatterlist *sg_sync;
	int ret = -ENOMEM;
	struct list_head pages;
	struct list_head pages_from_pool;
	struct page_info *info, *tmp_info;
	int i = 0;
	unsigned int nents_sync = 0;
	unsigned long size_remaining = PAGE_ALIGN(size);
	unsigned int max_order = orders[0];
	struct pages_mem data;
	unsigned int sz;
	int vmid = get_secure_vmid(buffer->flags);
	unsigned long from_pool_pages[NUM_ORDERS] = { 0, 0, 0 };
	unsigned long from_buddy_pages[NUM_ORDERS] = { 0, 0, 0 };
	unsigned long long time;
	unsigned long long run_time;
	unsigned long long run_delay = 0;
	unsigned long free_pages = 0;
	unsigned long num_pages;
	struct ion_pool_prefetch_ctrl *ctrl = NULL;
	bool cached = ion_buffer_cached(buffer);

	get_global_mem_wmarks(NULL, NULL, &free_pages);
	time = ktime_get();
	run_time = task_sched_runtime(current);
#ifdef CONFIG_SCHED_INFO
	run_delay = current->sched_info.run_delay;
#endif

	if (size / PAGE_SIZE > totalram_pages / 2)
		return -ENOMEM;
	ion_system_heap_init_buffer_stats(buffer);
	if (ion_heap_is_system_heap_type(buffer->heap->type) &&
	    is_secure_vmid_valid(vmid)) {
		pr_info("%s: System heap doesn't support secure allocations\n",
			__func__);
		return -EINVAL;
	}

	data.size = 0;
	INIT_LIST_HEAD(&pages);
	INIT_LIST_HEAD(&pages_from_pool);

	while (size_remaining > 0) {
		if (is_secure_vmid_valid(vmid))
			info = alloc_from_pool_preferred(sys_heap, buffer,
							 size_remaining,
							 max_order);
		else
			info = alloc_largest_available(sys_heap, buffer,
						       size_remaining,
						       max_order);

		if (IS_ERR(info)) {
			ret = PTR_ERR(info);
			goto err;
		}

		sz = (1 << info->order) * PAGE_SIZE;

		mod_node_page_state(page_pgdat(info->page),
				    NR_UNRECLAIMABLE_PAGES,
				    (1 << (info->order)));

		if (info->from_pool) {
			list_add_tail(&info->list, &pages_from_pool);
			from_pool_pages[order_to_index(info->order)] +=
				1 << (info->order);
		} else {
			list_add_tail(&info->list, &pages);
			from_buddy_pages[order_to_index(info->order)] +=
				1 << (info->order);
			data.size += sz;
			++nents_sync;
		}
		size_remaining -= sz;
		max_order = info->order;
		i++;
		ion_system_heap_update_buffer_stats(buffer, max_order, 1);
	}

	ret = ion_heap_alloc_pages_mem(&data);

	if (ret)
		goto err;

	table = kzalloc(sizeof(*table), GFP_KERNEL);
	if (!table) {
		ret = -ENOMEM;
		goto err_free_data_pages;
	}

	ret = sg_alloc_table(table, i, GFP_KERNEL);
	if (ret)
		goto err1;

	if (nents_sync) {
		ret = sg_alloc_table(&table_sync, nents_sync, GFP_KERNEL);
		if (ret)
			goto err_free_sg;
	}

	i = 0;
	sg = table->sgl;
	sg_sync = table_sync.sgl;

	/*
	 * We now have two separate lists. One list contains pages from the
	 * pool and the other pages from buddy. We want to merge these
	 * together while preserving the ordering of the pages (higher order
	 * first).
	 */
	do {
		info = list_first_entry_or_null(&pages, struct page_info, list);
		tmp_info = list_first_entry_or_null(&pages_from_pool,
						    struct page_info, list);
		if (info && tmp_info) {
			if (info->order >= tmp_info->order) {
				i = process_info(info, sg, sg_sync, &data, i);
				sg_sync = sg_next(sg_sync);
			} else {
				i = process_info(tmp_info, sg, 0, 0, i);
			}
		} else if (info) {
			i = process_info(info, sg, sg_sync, &data, i);
			sg_sync = sg_next(sg_sync);
		} else if (tmp_info) {
			i = process_info(tmp_info, sg, 0, 0, i);
		}
		sg = sg_next(sg);

	} while (sg);

	if (nents_sync) {
		if (vmid > 0) {
			ret = ion_hyp_assign_sg(&table_sync, &vmid, 1, true);
			if (ret)
				goto err_free_sg2;
		}
	}

	buffer->sg_table = table;
	if (nents_sync)
		sg_free_table(&table_sync);
	ion_heap_free_pages_mem(&data);
	time = ktime_us_delta(ktime_get(), time);
	run_time = ktime_us_delta(task_sched_runtime(current), run_time);
#ifdef CONFIG_SCHED_INFO
	run_delay = ktime_us_delta(current->sched_info.run_delay, run_delay);
#endif
	if (!cached && run_time >= sys_heap->prefetch_ctrls[ION_POOL_UNCACHED]
					   .alloc_warn_time_thresh)
		pr_warn("%s: alloc_size %zu time_cost %lld run_time %llu delay %llu from_pool_pages [%lu %lu %lu] "
			"from_buddy_pages [%lu %lu %lu] free-pages %lu pool_watermark %lu",
			__func__, size, time, run_time, run_delay,
			from_pool_pages[0], from_pool_pages[1],
			from_pool_pages[2], from_buddy_pages[0],
			from_buddy_pages[1], from_buddy_pages[2], free_pages,
			sys_heap->prefetch_ctrls[ION_POOL_UNCACHED].pool_watermark);

	if (!cached) {
		ion_alloc_stat(&ion_alloc_stats, run_time,
			       from_pool_pages[0] + from_pool_pages[1] +
				       from_pool_pages[2],
			       from_buddy_pages[0] + from_buddy_pages[1] +
				       from_buddy_pages[2]);
		num_pages = PAGE_ALIGN(size) / PAGE_SIZE;
		ctrl = &sys_heap->prefetch_ctrls[ION_POOL_UNCACHED];
		mutex_lock(&ctrl->pool_watermark_lock);
		if (ctrl->pool_watermark > num_pages)
			ctrl->pool_watermark -= num_pages;
		else
			ctrl->pool_watermark = 0;

		mutex_unlock(&ctrl->pool_watermark_lock);
	}
	return 0;

err_free_sg2:
	/* We failed to zero buffers. Bypass pool */
	buffer->private_flags |= ION_PRIV_FLAG_SHRINKER_FREE;

	if (vmid > 0)
		if (ion_hyp_unassign_sg(table, &vmid, 1, true, false))
			goto err_free_table_sync;

	for_each_sg(table->sgl, sg, table->nents, i)
		free_buffer_page(sys_heap, buffer, sg_page(sg),
				 get_order(sg->length));
err_free_table_sync:
	if (nents_sync)
		sg_free_table(&table_sync);
err_free_sg:
	sg_free_table(table);
err1:
	kfree(table);
err_free_data_pages:
	ion_heap_free_pages_mem(&data);
err:
	list_for_each_entry_safe(info, tmp_info, &pages, list) {
		free_buffer_page(sys_heap, buffer, info->page, info->order);
		kfree(info);
	}
	list_for_each_entry_safe(info, tmp_info, &pages_from_pool, list) {
		free_buffer_page(sys_heap, buffer, info->page, info->order);
		kfree(info);
	}
	return ret;
}

void ion_system_heap_free(struct ion_buffer *buffer)
{
	struct ion_heap *heap = buffer->heap;
	struct ion_system_heap *sys_heap = container_of(heap,
							struct ion_system_heap,
							heap);
	struct sg_table *table = buffer->sg_table;
	struct scatterlist *sg;
	int i;
	int vmid = get_secure_vmid(buffer->flags);

	if (!(buffer->private_flags & ION_PRIV_FLAG_SHRINKER_FREE) &&
	    !(buffer->flags & ION_FLAG_POOL_FORCE_ALLOC)) {
		if (vmid < 0)
			ion_heap_buffer_zero(buffer);
	} else if (vmid > 0) {
		if (ion_hyp_unassign_sg(table, &vmid, 1, true, false))
			return;
	}

	for_each_sg(table->sgl, sg, table->nents, i)
		free_buffer_page(sys_heap, buffer, sg_page(sg),
				 get_order(sg->length));
	sg_free_table(table);
	kfree(table);
}

int ion_msm_page_pool_total(struct ion_page_pool *pool, bool high)
{
	int count = pool->low_count;

	if (high)
		count += pool->high_count;

	return count << pool->order;
}

static int ion_msm_page_pool_page_count(struct ion_page_pool **pools)
{
	struct ion_page_pool *pool = NULL;
	int nr_pool_total = 0;
	int i;
	if (!pools)
		return 0;
	for (i = 0; i < NUM_ORDERS; i++) {
		pool = pools[i];
		nr_pool_total += ion_msm_page_pool_total(pool, false);
	}

	return nr_pool_total;
}

static int ion_system_heap_shrink(struct ion_heap *heap, gfp_t gfp_mask,
				 int nr_to_scan)
{
	struct ion_system_heap *sys_heap;
	int nr_total = 0;
	int i, j, nr_freed = 0;
	int only_scan = 0;
	struct ion_page_pool *pool;
	long gt_wm_count = 0; /* greater than watermark count */


	sys_heap = container_of(heap, struct ion_system_heap, heap);

	if (!nr_to_scan)
		only_scan = 1;

	/* shrink the pools starting from lower order ones */
	for (i = NUM_ORDERS - 1; i >= 0; i--) {
		nr_freed = 0;

		for (j = 0; j < VMID_LAST; j++) {
			if (is_secure_vmid_valid(j))
				nr_freed +=
					ion_secure_page_pool_shrink(sys_heap,
								    j, i,
								    nr_to_scan);
		}


		if (sys_heap->prefetch_ctrls[ION_POOL_UNCACHED].pool_watermark <=
		    LONG_MAX)
			gt_wm_count = (long)ion_msm_page_pool_page_count(sys_heap->uncached_pools) -
				(long)sys_heap->prefetch_ctrls[ION_POOL_UNCACHED].pool_watermark;
		if (gt_wm_count > 0) {
			pool = sys_heap->uncached_pools[i];
			nr_freed +=
				ion_page_pool_shrink(pool, gfp_mask,
				(nr_to_scan > gt_wm_count) ? (int)gt_wm_count : nr_to_scan);
		}
		gt_wm_count = 0;
		if (sys_heap->prefetch_ctrls[ION_POOL_CACHED].pool_watermark <=
		    LONG_MAX)
			gt_wm_count = (long)ion_msm_page_pool_page_count(sys_heap->cached_pools) -
				(long)sys_heap->prefetch_ctrls[ION_POOL_CACHED].pool_watermark;
		if (gt_wm_count > 0) {
			pool = sys_heap->cached_pools[i];
			nr_freed +=
				ion_page_pool_shrink(pool, gfp_mask,
				(nr_to_scan > gt_wm_count) ? (int)gt_wm_count : nr_to_scan);
		}

		nr_total += nr_freed;

		if (!only_scan) {
			nr_to_scan -= nr_freed;
			/* shrink completed */
			if (nr_to_scan <= 0)
				break;
		}
	}

	return nr_total;
}

static struct ion_heap_ops system_heap_ops = {
	.allocate = ion_system_heap_allocate,
	.free = ion_system_heap_free,
	.map_kernel = ion_heap_map_kernel,
	.unmap_kernel = ion_heap_unmap_kernel,
	.map_user = ion_heap_map_user,
	.shrink = ion_system_heap_shrink,
};

static int ion_system_heap_debug_show(struct ion_heap *heap, struct seq_file *s,
				      void *unused)
{
	struct ion_system_heap *sys_heap;
	bool use_seq = s;
	unsigned long uncached_total = 0;
	unsigned long cached_total = 0;
	unsigned long secure_total = 0;
	struct ion_page_pool *pool;
	int i, j;

	sys_heap = container_of(heap, struct ion_system_heap, heap);
	for (i = 0; i < NUM_ORDERS; i++) {
		pool = sys_heap->uncached_pools[i];
		if (use_seq) {
			seq_printf(s,
				   "%d order %u highmem pages in uncached pool = %lu total\n",
				   pool->high_count, pool->order,
				   (1 << pool->order) * PAGE_SIZE *
					pool->high_count);
			seq_printf(s,
				   "%d order %u lowmem pages in uncached pool = %lu total\n",
				   pool->low_count, pool->order,
				   (1 << pool->order) * PAGE_SIZE *
					pool->low_count);
		}

		uncached_total += (1 << pool->order) * PAGE_SIZE *
			pool->high_count;
		uncached_total += (1 << pool->order) * PAGE_SIZE *
			pool->low_count;
	}

	for (i = 0; i < NUM_ORDERS; i++) {
		pool = sys_heap->cached_pools[i];
		if (use_seq) {
			seq_printf(s,
				   "%d order %u highmem pages in cached pool = %lu total\n",
				   pool->high_count, pool->order,
				   (1 << pool->order) * PAGE_SIZE *
					pool->high_count);
			seq_printf(s,
				   "%d order %u lowmem pages in cached pool = %lu total\n",
				   pool->low_count, pool->order,
				   (1 << pool->order) * PAGE_SIZE *
					pool->low_count);
		}

		cached_total += (1 << pool->order) * PAGE_SIZE *
			pool->high_count;
		cached_total += (1 << pool->order) * PAGE_SIZE *
			pool->low_count;
	}

	for (i = 0; i < NUM_ORDERS; i++) {
		for (j = 0; j < VMID_LAST; j++) {
			if (!is_secure_vmid_valid(j))
				continue;
			pool = sys_heap->secure_pools[j][i];

			if (use_seq) {
				seq_printf(s,
					   "VMID %d: %d order %u highmem pages in secure pool = %lu total\n",
					   j, pool->high_count, pool->order,
					   (1 << pool->order) * PAGE_SIZE *
						pool->high_count);
				seq_printf(s,
					   "VMID  %d: %d order %u lowmem pages in secure pool = %lu total\n",
					   j, pool->low_count, pool->order,
					   (1 << pool->order) * PAGE_SIZE *
						pool->low_count);
			}

			secure_total += (1 << pool->order) * PAGE_SIZE *
					 pool->high_count;
			secure_total += (1 << pool->order) * PAGE_SIZE *
					 pool->low_count;
		}
	}

	if (use_seq) {
		seq_puts(s, "--------------------------------------------\n");
		seq_printf(s, "uncached pool = %lu cached pool = %lu secure pool = %lu\n",
			   uncached_total, cached_total, secure_total);
		seq_printf(s, "pool total (uncached + cached + secure) = %lu\n",
			   uncached_total + cached_total + secure_total);
		seq_puts(s, "--------------------------------------------\n");
	} else {
		pr_info("-------------------------------------------------\n");
		pr_info("uncached pool = %lu cached pool = %lu secure pool = %lu\n",
			uncached_total, cached_total, secure_total);
		pr_info("pool total (uncached + cached + secure) = %lu\n",
			uncached_total + cached_total + secure_total);
		pr_info("-------------------------------------------------\n");
	}

	return 0;
}

static void ion_system_heap_destroy_pools(struct ion_page_pool **pools)
{
	int i;

	for (i = 0; i < NUM_ORDERS; i++)
		if (pools[i]) {
			ion_page_pool_destroy(pools[i]);
			pools[i] = NULL;
		}
}

/**
 * ion_system_heap_create_pools - Creates pools for all orders
 *
 * If this fails you don't need to destroy any pools. It's all or
 * nothing. If it succeeds you'll eventually need to use
 * ion_system_heap_destroy_pools to destroy the pools.
 */
static int ion_system_heap_create_pools(struct ion_system_heap *sys_heap,
					struct ion_page_pool **pools,
					bool cached)
{
	int i;

	for (i = 0; i < NUM_ORDERS; i++) {
		struct ion_page_pool *pool;
		gfp_t gfp_flags = low_order_gfp_flags;

		if (orders[i])
			gfp_flags = high_order_gfp_flags;
		pool = ion_page_pool_create(gfp_flags, orders[i], cached);
		if (!pool)
			goto err_create_pool;
		pool->dev = sys_heap->heap.priv;
		pools[i] = pool;
	}
	return 0;
err_create_pool:
	ion_system_heap_destroy_pools(pools);
	return -ENOMEM;
}

static int ion_sys_heap_worker(void *data)
{
	struct ion_page_pool **pools = (struct ion_page_pool **)data;
	int i;

	for (;;) {
		for (i = 0; i < NUM_ORDERS; i++) {
			if (pool_count_below_lowmark(pools[i]))
				ion_page_pool_refill(pools[i]);
		}
		set_current_state(TASK_INTERRUPTIBLE);
		if (unlikely(kthread_should_stop())) {
			set_current_state(TASK_RUNNING);
			break;
		}
		schedule();

		set_current_state(TASK_RUNNING);
	}

	return 0;
}

static struct task_struct *ion_create_kworker(struct ion_page_pool **pools,
					      bool cached)
{
	struct sched_attr attr = { 0 };
	struct task_struct *thread;
	int ret;
	char *buf;

	attr.sched_nice = ION_KTHREAD_NICE_VAL;
	buf = cached ? "cached" : "uncached";

	thread = kthread_run(ion_sys_heap_worker, pools,
			     "ion-pool-%s-worker", buf);
	if (IS_ERR(thread)) {
		pr_err("%s: failed to create %s worker thread: %ld\n",
		       __func__, buf, PTR_ERR(thread));
		return thread;
	}
	ret = sched_setattr(thread, &attr);
	if (ret) {
		kthread_stop(thread);
		pr_warn("%s: failed to set task priority for %s worker thread: ret = %d\n",
			__func__, buf, ret);
		return ERR_PTR(ret);
	}

	return thread;
}

static inline struct ion_page_pool** ion_msm_get_page_pools(enum ion_pool_type type)
{
	struct ion_page_pool** pools = NULL;
	if (!ion_sys_heap || !is_ion_pool_type_valid(type))
		return NULL;
	if (type == ION_POOL_UNCACHED)
		pools = ion_sys_heap->uncached_pools;
	else
		pools = ion_sys_heap->cached_pools;
	return pools;
}

static int pool_watermark_kthread(void *p)
{
	struct ion_system_heap *heap = ion_sys_heap;
	struct ion_pool_prefetch_ctrl *ctrl = (struct ion_pool_prefetch_ctrl *)p;
	int ret;
	long nr_fill_count = 0;
	struct ion_page_pool **pools = NULL;

	if (!heap || !ctrl || !is_ion_pool_type_valid(ctrl->type))
		return -EINVAL;
	pools = ion_msm_get_page_pools(ctrl->type);
	if (!pools)
		return -EINVAL;

	while (!kthread_should_stop()) {
		ret = wait_event_interruptible(ctrl->pool_watermark_wait,
						atomic_read(&ctrl->wait_flag));
		if (ret)
			continue;

		atomic_set(&ctrl->wait_flag, 0);
		if (ctrl->pool_watermark <= LONG_MAX)
			nr_fill_count = (long)ctrl->pool_watermark -
					(long)ion_msm_page_pool_page_count(pools);
		if (nr_fill_count <= 0)
			continue;
		pr_info("pool_watermark_kthread run %s %lu %ld start",
			ctrl->type == ION_POOL_UNCACHED ? "uncached" : "cached", ctrl->pool_watermark, nr_fill_count);
		fill_pool_watermark(pools, nr_fill_count);
		pr_info("pool_watermark_kthread run %s end",
			ctrl->type == ION_POOL_UNCACHED ? "uncached" : "cached");
	}

	return 0;
}

static int
ion_msm_system_heap_create_prefetch_thread(struct ion_pool_prefetch_ctrl *ctrl,
					   enum ion_pool_type type)
{
	if (!ctrl || !is_ion_pool_type_valid(type))
		return -1;

	atomic_set(&ctrl->wait_flag, 0);
	ctrl->type = type;
	ctrl->pool_watermark = 0;
	ctrl->prefill_low_percent = DEFAULT_PREFILL_LOW_PERCENT;
	ctrl->prefill_high_percent = DEFAULT_PREFILL_HIGH_PERCENT;
	ctrl->alloc_warn_time_thresh = DEFAULT_ALLOC_WARN_TIME_THRESH;

	init_waitqueue_head(&ctrl->pool_watermark_wait);
	mutex_init(&ctrl->pool_watermark_lock);
	ctrl->pool_watermark_kthread =
		kthread_run(pool_watermark_kthread, ctrl,
			    ctrl->type == ION_POOL_CACHED ?
				    "sysmtem_watermark" :
					  "system_uncached_watermark");
	if (IS_ERR(ctrl->pool_watermark_kthread)) {
		pr_err("%s: kthread_create failed!\n", __func__);
		return -1;
	}

	return 0;
}

static void
ion_msm_system_heap_destroy_prefetch_thread(struct ion_pool_prefetch_ctrl *ctrl)
{
	if (!IS_ERR_OR_NULL(ctrl->pool_watermark_kthread)) {
		kthread_stop(ctrl->pool_watermark_kthread);
		ctrl->type = ION_MAX_NUM_POOLS;
		ctrl->pool_watermark_kthread = NULL;
	}
}

static bool get_config_watermark(enum ion_pool_type type,
				 unsigned long *min_wmark,
				 unsigned long *low_wmark,
				 unsigned long *free_pages)
{
	unsigned long num_min = 0;
	unsigned long num_low = 0;
	unsigned long num_free = 0;
	unsigned long low_percent;
	unsigned long high_percent;
	struct ion_pool_prefetch_ctrl *ctrl = NULL;
	if (!ion_sys_heap || !is_ion_pool_type_valid(type))
		return false;
	ctrl = &ion_sys_heap->prefetch_ctrls[type];
	low_percent = ctrl->prefill_low_percent;
	high_percent = ctrl->prefill_high_percent;
	get_global_mem_wmarks(&num_min, &num_low, &num_free);
	pr_info("ion_msm_heap mem-info %s: %lu %lu %lu", __func__, num_min,
		num_low, num_free);
	if (num_min >= num_low || low_percent > high_percent)
		return false;
	if (min_wmark)
		*min_wmark =
			num_min + ((num_low - num_min) * low_percent) / 100;
	if (low_wmark)
		*low_wmark =
			num_min + ((num_low - num_min) * high_percent) / 100;
	if (free_pages)
		*free_pages = num_free;
	return true;
}

static bool pool_watermark_check(struct ion_system_heap *heap,
					unsigned long nr_watermark, enum ion_pool_type type)
{
	unsigned long nr_pool_count = 0;
	struct ion_page_pool **pools = NULL;

	if (!nr_watermark)
		return false;
	pools = ion_msm_get_page_pools(type);
	if (!pools)
		return false;

	nr_pool_count = (unsigned long)ion_msm_page_pool_page_count(pools);
	if (nr_pool_count >= nr_watermark)
		return false;

	return true;
}

static void ion_pool_watermark_wakeup(enum ion_pool_type type)
{
	struct ion_pool_prefetch_ctrl *ctrl = NULL;
	struct ion_system_heap *heap = ion_sys_heap;
	if (!is_ion_pool_type_valid(type))
		return;
	ctrl = &heap->prefetch_ctrls[type];
	atomic_set(&ctrl->wait_flag, 1);
	wake_up_interruptible(&ctrl->pool_watermark_wait);
}

void set_ion_watermark(enum ion_pool_type type, unsigned long watermark)
{
	unsigned long nr_watermark = watermark / PAGE_SIZE;
	bool pool_wakeup = true;
	struct ion_system_heap *heap = ion_sys_heap;
	struct ion_pool_prefetch_ctrl *ctrl = NULL;

	if (!is_ion_pool_type_valid(type))
		return;
	ctrl = &heap->prefetch_ctrls[type];

	if (!wq_has_sleeper(&ctrl->pool_watermark_wait))
		goto drain_pages;

	pool_wakeup = pool_watermark_check(heap, nr_watermark, type);

	mutex_lock(&ctrl->pool_watermark_lock);
	if (!nr_watermark || ctrl->pool_watermark < nr_watermark)
		ctrl->pool_watermark = nr_watermark;
	mutex_unlock(&ctrl->pool_watermark_lock);

	if (pool_wakeup)
		ion_pool_watermark_wakeup(type);

drain_pages:
	if (!nr_watermark && type == ION_POOL_CACHED)
		ion_heap_freelist_drain(&heap->heap, 0);
}

static unsigned long
adjust_dynamic_system_pool_watermark(unsigned long nr_watermark,
				     enum ion_pool_type type)
{
	unsigned long min_wmark = 0;
	unsigned long low_wmark = 0;
	unsigned long num_free = 0;
	unsigned long pages_in_pool;
	unsigned long max_to_fill;
	struct ion_page_pool **pools = NULL;

	if (!is_ion_pool_type_valid(type))
		return nr_watermark;
	pools = ion_msm_get_page_pools(type);
	if (!pools)
		return nr_watermark;
	pages_in_pool = ion_msm_page_pool_page_count(pools);
	pr_info("ion_msm_heap mem-info %s pages-pool: %lu", __func__,
		pages_in_pool);
	if (pages_in_pool >= nr_watermark)
		return nr_watermark;
	if (!get_config_watermark(type, &min_wmark, &low_wmark, &num_free))
		return nr_watermark;

	if (num_free <= low_wmark)
		return pages_in_pool;

	max_to_fill = num_free - min_wmark;
	if (max_to_fill <= nr_watermark - pages_in_pool)
		nr_watermark = pages_in_pool + max_to_fill;

	return nr_watermark;
}

static ssize_t
sys_pool_dynamic_watermark_bytes_show(struct kobject *kobj,
				      struct kobj_attribute *attr, char *buf)
{
	u64 nr_pages = 0;
	if (ion_sys_heap)
		nr_pages = (u64)(ion_sys_heap
					 ->prefetch_ctrls[ION_POOL_UNCACHED]
					 .pool_watermark);
	return sprintf(buf, "%llu\n", nr_pages << PAGE_SHIFT);
}

static ssize_t
sys_pool_dynamic_watermark_bytes_store(struct kobject *kobj,
				       struct kobj_attribute *attr,
				       const char *buf, size_t size)
{
	unsigned long val = 0;
	int ret = 0;

	ret = kstrtoul(buf, 0, &val);
	if (ret)
		return ret;
	if (!ion_sys_heap)
		return ret;

	if (val > MAX_WATER_MARK)
		val = MAX_WATER_MARK;

	val = adjust_dynamic_system_pool_watermark(val, ION_POOL_UNCACHED);
	pr_info("ion_msm_heap %s: %lu", __func__, val);
	set_ion_watermark(ION_POOL_UNCACHED, val);

	return size;
}
static struct kobj_attribute sys_pool_dynamic_watermark_bytes =
	__ATTR_RW(sys_pool_dynamic_watermark_bytes);

static ssize_t
sys_pool_prefill_low_percent_store(struct kobject *kobj,
						  struct kobj_attribute *attr,
						  const char *buf, size_t size)
{
	unsigned long val = 0;
	int ret = 0;

	ret = kstrtoul(buf, 0, &val);
	if (ret)
		return ret;

	if (val > MAX_POOL_PREFILL_PERCENT)
		val = MAX_POOL_PREFILL_PERCENT;
	if (ion_sys_heap)
		ion_sys_heap->prefetch_ctrls[ION_POOL_UNCACHED]
			.prefill_low_percent = val;
	pr_info("ion_msm_heap %s: new prefill_low_percent %lu", __func__, val);

	return size;
}

static ssize_t
sys_pool_prefill_low_percent_show(struct kobject *kobj,
						 struct kobj_attribute *attr,
						 char *buf)
{
	unsigned long val = 0;
	if (ion_sys_heap)
		val = ion_sys_heap
			      ->prefetch_ctrls[ION_POOL_UNCACHED]
			      .prefill_low_percent = val;
	return sprintf(buf, "%lu\n", val);
}

static struct kobj_attribute sys_pool_prefill_low_percent =
	__ATTR_RW(sys_pool_prefill_low_percent);

static ssize_t
sys_pool_prefill_high_percent_store(struct kobject *kobj,
						   struct kobj_attribute *attr,
						   const char *buf, size_t size)
{
	unsigned long val = 0;
	int ret = 0;

	ret = kstrtoul(buf, 0, &val);
	if (ret)
		return ret;

	if (val > MAX_POOL_PREFILL_PERCENT)
		val = MAX_POOL_PREFILL_PERCENT;
	if (ion_sys_heap)
		ion_sys_heap->prefetch_ctrls[ION_POOL_UNCACHED]
			.prefill_high_percent = val;
	pr_info("dma_heap %s: new prefill_high_percent %lu", __func__, val);

	return size;
}

static ssize_t
sys_pool_prefill_high_percent_show(struct kobject *kobj,
						  struct kobj_attribute *attr,
						  char *buf)
{
	unsigned long val = 0;
	if (ion_sys_heap)
		val = ion_sys_heap
			      ->prefetch_ctrls[ION_POOL_UNCACHED]
			      .prefill_high_percent;
	return sprintf(buf, "%lu\n", val);
}

static struct kobj_attribute sys_pool_prefill_high_percent =
	__ATTR_RW(sys_pool_prefill_high_percent);

static ssize_t
sys_heap_alloc_warn_time_thresh_store(struct kobject *kobj,
				      struct kobj_attribute *attr,
				      const char *buf, size_t size)
{
	unsigned long val = 0;
	int ret = 0;

	ret = kstrtoul(buf, 0, &val);
	if (ret)
		return ret;
	if (ion_sys_heap)
		ion_sys_heap->prefetch_ctrls[ION_POOL_UNCACHED]
			.alloc_warn_time_thresh = val;
	pr_info("dma_heap %s: new alloc_warn_time_thresh %lu", __func__, val);

	return size;
}

static ssize_t
sys_heap_alloc_warn_time_thresh_show(struct kobject *kobj,
						    struct kobj_attribute *attr,
						    char *buf)
{
	unsigned long val = 0;
	if (ion_sys_heap)
		val = ion_sys_heap
			      ->prefetch_ctrls[ION_POOL_UNCACHED]
			      .alloc_warn_time_thresh;
	return sprintf(buf, "%lu\n", val);
}

static struct kobj_attribute sys_heap_alloc_warn_time_thresh =
	__ATTR_RW(sys_heap_alloc_warn_time_thresh);

static ssize_t sys_heap_alloc_stats_show(struct kobject *kobj,
					 struct kobj_attribute *attr, char *buf)
{
	return sprintf(
		buf, "%lld %lld %lld %lld %lld %lld %lld %lld %lld %lld\n",
		atomic64_read(&ion_alloc_stats.alloc_total_times),
		atomic64_read(&ion_alloc_stats.alloc_from_pool_total_times),
		atomic64_read(&ion_alloc_stats.alloc_from_buddy_total_times),
		atomic64_read(&ion_alloc_stats.alloc_from_pool_and_buddy_total_times),
		atomic64_read(&ion_alloc_stats.stat_less_4ms),
		atomic64_read(&ion_alloc_stats.stat_4to6ms),
		atomic64_read(&ion_alloc_stats.stat_6to8ms),
		atomic64_read(&ion_alloc_stats.stat_8to11ms),
		atomic64_read(&ion_alloc_stats.stat_11to16ms),
		atomic64_read(&ion_alloc_stats.stat_greater_16ms));
}

static struct kobj_attribute sys_heap_alloc_stats =
	__ATTR_RO(sys_heap_alloc_stats);

static struct attribute *system_watermark_attrs[] = {
	&sys_pool_dynamic_watermark_bytes.attr,
	&sys_pool_prefill_low_percent.attr,
	&sys_pool_prefill_high_percent.attr,
	&sys_heap_alloc_warn_time_thresh.attr,
	&sys_heap_alloc_stats.attr,
	NULL,
};

static const struct attribute_group system_watermark_group = {
	.attrs = system_watermark_attrs,
};

struct ion_heap *ion_system_heap_create(struct ion_platform_heap *data)
{
	struct ion_system_heap *heap;
	int ret = -ENOMEM;
	int i;

	heap = kzalloc(sizeof(*heap), GFP_KERNEL);
	if (!heap)
		return ERR_PTR(-ENOMEM);
	heap->heap.ops = &system_heap_ops;
	heap->heap.type = ION_HEAP_TYPE_SYSTEM;
#ifdef CONFIG_ION_BUFFER_REUSE
	heap->heap.flags = ION_HEAP_FLAG_DEFER_FREE |
			   ION_HEAP_FLAG_FREE_BUF_REUSE;
#else
	heap->heap.flags = ION_HEAP_FLAG_DEFER_FREE;
#endif
	heap->heap.priv = data->priv;

	for (i = 0; i < VMID_LAST; i++)
		if (is_secure_vmid_valid(i))
			if (ion_system_heap_create_pools(heap,
							 heap->secure_pools[i],
							 false))
				goto destroy_secure_pools;

	if (ion_system_heap_create_pools(heap, heap->uncached_pools, false))
		goto destroy_secure_pools;

	if (ion_system_heap_create_pools(heap, heap->cached_pools, true))
		goto destroy_uncached_pools;

	if (pool_auto_refill_en) {
		heap->kworker[ION_KTHREAD_UNCACHED] =
				ion_create_kworker(heap->uncached_pools, false);
		if (IS_ERR(heap->kworker[ION_KTHREAD_UNCACHED])) {
			ret = PTR_ERR(heap->kworker[ION_KTHREAD_UNCACHED]);
			goto destroy_pools;
		}
		heap->kworker[ION_KTHREAD_CACHED] =
				ion_create_kworker(heap->cached_pools, true);
		if (IS_ERR(heap->kworker[ION_KTHREAD_CACHED])) {
			kthread_stop(heap->kworker[ION_KTHREAD_UNCACHED]);
			ret = PTR_ERR(heap->kworker[ION_KTHREAD_CACHED]);
			goto destroy_pools;
		}
	}

	mutex_init(&heap->split_page_mutex);
	ret = ion_heap_watermark_init("system", &system_watermark_group);
	if (ret) {
		pr_err("%s: ion_heap_watermark_init failed!\n", __func__);
		goto destroy_pools;
	}

	heap->heap.debug_show = ion_system_heap_debug_show;
#ifdef CONFIG_ION_WIDE_INFO
	heap->heap.get_heap_stats = ion_system_heap_get_heap_stats;
	heap->heap.get_buffer_stats = ion_system_heap_get_buffer_stats;
#endif
	ion_sys_heap = heap;
	if (ion_msm_system_heap_create_prefetch_thread(
		    &heap->prefetch_ctrls[ION_POOL_CACHED], ION_POOL_CACHED) < 0)
		goto destroy_prefetch;
	if (ion_msm_system_heap_create_prefetch_thread(
		    &heap->prefetch_ctrls[ION_POOL_UNCACHED], ION_POOL_UNCACHED) < 0)
		goto destroy_uncached_prefetch;
	return &heap->heap;
destroy_prefetch:
	ion_msm_system_heap_destroy_prefetch_thread(&heap->prefetch_ctrls[ION_POOL_CACHED]);
destroy_uncached_prefetch:
	ion_msm_system_heap_destroy_prefetch_thread(&heap->prefetch_ctrls[ION_POOL_UNCACHED]);
destroy_pools:
	ion_system_heap_destroy_pools(heap->cached_pools);
destroy_uncached_pools:
	ion_system_heap_destroy_pools(heap->uncached_pools);
destroy_secure_pools:
	for (i = 0; i < VMID_LAST; i++) {
		if (heap->secure_pools[i])
			ion_system_heap_destroy_pools(heap->secure_pools[i]);
	}
	kfree(heap);
	return ERR_PTR(ret);
}

static int ion_system_contig_heap_allocate(struct ion_heap *heap,
					   struct ion_buffer *buffer,
					   unsigned long len,
					   unsigned long flags)
{
	int order = get_order(len);
	struct page *page;
	struct sg_table *table;
	unsigned long i;
	int ret;

	page = alloc_pages(low_order_gfp_flags | __GFP_NOWARN, order);
	if (!page)
		return -ENOMEM;

	split_page(page, order);

	len = PAGE_ALIGN(len);
	for (i = len >> PAGE_SHIFT; i < (1 << order); i++)
		__free_page(page + i);

	table = kmalloc(sizeof(*table), GFP_KERNEL);
	if (!table) {
		ret = -ENOMEM;
		goto free_pages;
	}

	ret = sg_alloc_table(table, 1, GFP_KERNEL);
	if (ret)
		goto free_table;

	sg_set_page(table->sgl, page, len, 0);

	buffer->sg_table = table;

	ion_pages_sync_for_device(NULL, page, len, DMA_BIDIRECTIONAL);

	return 0;

free_table:
	kfree(table);
free_pages:
	for (i = 0; i < len >> PAGE_SHIFT; i++)
		__free_page(page + i);

	return ret;
}

static void ion_system_contig_heap_free(struct ion_buffer *buffer)
{
	struct sg_table *table = buffer->sg_table;
	struct page *page = sg_page(table->sgl);
	unsigned long pages = PAGE_ALIGN(buffer->size) >> PAGE_SHIFT;
	unsigned long i;

	for (i = 0; i < pages; i++)
		__free_page(page + i);
	sg_free_table(table);
	kfree(table);
}

static struct ion_heap_ops kmalloc_ops = {
	.allocate = ion_system_contig_heap_allocate,
	.free = ion_system_contig_heap_free,
	.map_kernel = ion_heap_map_kernel,
	.unmap_kernel = ion_heap_unmap_kernel,
	.map_user = ion_heap_map_user,
};

struct ion_heap *ion_system_contig_heap_create(struct ion_platform_heap *unused)
{
	struct ion_heap *heap;

	heap = kzalloc(sizeof(*heap), GFP_KERNEL);
	if (!heap)
		return ERR_PTR(-ENOMEM);
	heap->ops = &kmalloc_ops;
	heap->type = ION_HEAP_TYPE_SYSTEM_CONTIG;
	return heap;
}
