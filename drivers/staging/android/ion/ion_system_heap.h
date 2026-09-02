/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
 */
#include <soc/qcom/secure_buffer.h>
#include "ion.h"

#ifndef _ION_SYSTEM_HEAP_H
#define _ION_SYSTEM_HEAP_H

#ifndef CONFIG_ALLOC_BUFFERS_IN_4K_CHUNKS
#if defined(CONFIG_IOMMU_IO_PGTABLE_ARMV7S)
static const unsigned int orders[] = {8, 4, 0};
#else
static const unsigned int orders[] = {9, 4, 0};
#endif
#else
static const unsigned int orders[] = {0};
#endif

#define NUM_ORDERS ARRAY_SIZE(orders)

#define ION_KTHREAD_NICE_VAL 10

enum ion_kthread_type {
	ION_KTHREAD_UNCACHED,
	ION_KTHREAD_CACHED,
	ION_MAX_NUM_KTHREADS
};

enum ion_pool_type {
	ION_POOL_UNCACHED,
	ION_POOL_CACHED,
	ION_MAX_NUM_POOLS,
};

struct ion_pool_prefetch_ctrl {
	enum ion_pool_type type;
	unsigned long pool_watermark;
	unsigned long prefill_low_percent;
	unsigned long prefill_high_percent;
	unsigned long alloc_warn_time_thresh;
	struct task_struct *pool_watermark_kthread;
	wait_queue_head_t pool_watermark_wait;
	atomic_t wait_flag;
	struct mutex pool_watermark_lock;
};

struct ion_system_heap {
	struct ion_heap heap;
	struct ion_page_pool *uncached_pools[MAX_ORDER];
	struct ion_page_pool *cached_pools[MAX_ORDER];
	/* worker threads to refill the pool */
	struct task_struct *kworker[ION_MAX_NUM_KTHREADS];
	struct ion_page_pool *secure_pools[VMID_LAST][MAX_ORDER];
	/* Prevents unnecessary page splitting */
	struct mutex split_page_mutex;
	struct ion_pool_prefetch_ctrl prefetch_ctrls[ION_MAX_NUM_POOLS];
};

struct ion_system_heap_stats {
	atomic64_t alloc_total_times;
	atomic64_t alloc_from_pool_total_times;
	atomic64_t alloc_from_buddy_total_times;
	atomic64_t alloc_from_pool_and_buddy_total_times;
	atomic64_t stat_less_4ms;
	atomic64_t stat_4to6ms;
	atomic64_t stat_6to8ms;
	atomic64_t stat_8to11ms;
	atomic64_t stat_11to16ms;
	atomic64_t stat_greater_16ms;
};

struct page_info {
	struct page *page;
	bool from_pool;
	unsigned int order;
	struct list_head list;
};

int order_to_index(unsigned int order);

void free_buffer_page(struct ion_system_heap *heap,
		      struct ion_buffer *buffer, struct page *page,
		      unsigned int order);
void set_sys_pool_watermark(enum ion_pool_type type, unsigned long watermark);
#endif /* _ION_SYSTEM_HEAP_H */
