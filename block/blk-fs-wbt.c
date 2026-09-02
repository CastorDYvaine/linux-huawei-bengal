/* SPDX-License-Identifier: GPL-2.0 */
/*
 * Copyright (C) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 * Description: Control wbt in fs layer
 *
 * This software is licensed under the terms of the GNU General Public
 * License version 2, as published by the Free Software Foundation, and
 * may be copied, distributed, and modified under those terms.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */
#include <linux/kernel.h>
#include <linux/blk_types.h>
#include <linux/slab.h>
#include <linux/backing-dev.h>
#include <linux/swap.h>

#include "blk-wbt.h"
#include "blk-rq-qos.h"

static inline bool rwb_enabled(struct rq_wb *rwb)
{
	return rwb && rwb->wb_normal != 0;
}

static inline bool __wbt_should_throttle(struct rq_wb *rwb, unsigned int opf)
{
	unsigned int op = opf & REQ_OP_MASK;

	/*
	 * If not a WRITE or DISCARD, do nothing
	 */
	if ((op != REQ_OP_WRITE) || (op == REQ_OP_DISCARD))
		return false;

	if ((opf & REQ_META) || (opf & REQ_SYNC))
		return false;

	/*
	 * Don't throttle WRITE_ODIRECT
	 */
	if ((opf & (REQ_SYNC | REQ_IDLE)) == (REQ_SYNC | REQ_IDLE))
		return false;

	return true;
}

static inline struct rq_wait *get_rq_wait(struct rq_wb *rwb)
{
	if (current_is_kswapd())
		return &rwb->rq_wait[WBT_RWQ_KSWAPD];

	return &rwb->rq_wait[WBT_RWQ_BG];
}

/* backport from blk-wbt.c for platformization */
static bool wb_recent_wait(struct rq_wb *rwb)
{
	struct bdi_writeback *wb = &rwb->rqos.q->backing_dev_info->wb;

	return time_before(jiffies, wb->dirty_sleep + HZ);
}

static bool close_io(struct rq_wb *rwb)
{
	const unsigned long now = jiffies;

	return time_before(now, rwb->last_issue + HZ / 10) ||
		time_before(now, rwb->last_comp + HZ / 10);
}

#define REQ_HIPRIO	(REQ_SYNC | REQ_META | REQ_PRIO)

static inline unsigned int get_limit(struct rq_wb *rwb, unsigned long rw)
{
	unsigned int limit;

	/*
	 * At this point we know it's a buffered write. If this is
	 * kswapd trying to free memory, or REQ_SYNC is set, then
	 * it's WB_SYNC_ALL writeback, and we'll use the max limit for
	 * that. If the write is marked as a background write, then use
	 * the idle limit, or go to normal if we haven't had competing
	 * IO for a bit.
	 */
	if ((rw & REQ_HIPRIO) || wb_recent_wait(rwb) || current_is_kswapd()) {
		limit = rwb->rq_depth.max_depth;
	} else if ((rw & REQ_BACKGROUND) || close_io(rwb)) {
		/*
		 * If less than 100ms since we completed unrelated IO,
		 * limit us to half the depth for background writeback.
		 */
		limit = rwb->wb_background;
	} else {
		limit = rwb->wb_normal;
	}
	return limit;
}

/*
 * It's a simply and rough way to kick bio, bio which
 * has been tracked by wbt(on fs) set NOMERGE after bio_alloc,
 * so we kick the bio with NOMERGE once it's full of pages.
 */
bool wbt_need_kick_bio(struct bio *bio)
{
	return (bio->bi_vcnt == bio->bi_max_vecs);
}

/* min wbt io size = 128k(32 pages) */
#define WBT_MIN_SECTOR	32

int wbt_max_bio_blocks(struct block_device *bdev, unsigned int opf,
		       int max, bool *nomerge)
{
	int wbt_max;
	struct request_queue *q = NULL;
	struct rq_wb *rwb = NULL;
	struct rq_qos *rqos = NULL;
	struct rq_depth *rqd = NULL;

	wbt_max = max;
	*nomerge = false;
	if (unlikely(!bdev) || unlikely(!bdev->bd_disk))
		goto out;

	q = bdev_get_queue(bdev);
	if (unlikely(!q))
		goto out;

	rqos = wbt_rq_qos(q);
	if (!rqos)
		goto out;

	rwb = RQWB(rqos);
	if (!rwb_enabled(rwb) || !__wbt_should_throttle(rwb, opf))
		goto out;

	wbt_max = max;
	rqd = &rwb->rq_depth;
	if (rqd->scale_step > 0) {
		wbt_max = WBT_MIN_SECTOR;
		*nomerge = true;
	}

out:
	return wbt_max;
}

static unsigned int wbt_get_wbc_limit(struct rq_wb *rwb,
				      struct writeback_control *wbc)
{
	unsigned long rw = 0;

	if (wbc->for_kupdate || wbc->for_background)
		rw |= REQ_BACKGROUND;
	if (wbc->sync_mode == WB_SYNC_ALL || wbc->for_sync == 1)
		rw |= REQ_SYNC;

	return get_limit(rwb, rw);
}

bool wbt_fs_get_quota(struct request_queue *q, struct writeback_control *wbc)
{
	struct rq_qos *rqos = wbt_rq_qos(q);
	struct rq_wb *rwb = NULL;
	struct rq_wait *rqw = NULL;

	if (!rqos)
		return true;
	rwb = RQWB(rqos);
	rqw = get_rq_wait(rwb);

	if (!rwb_enabled(rwb) || wbc->sync_mode == WB_SYNC_ALL
			|| wbc->for_sync == 1)
		return true;

	if (atomic_read(&rqw->inflight) < (int)wbt_get_wbc_limit(rwb, wbc))
		return true;

	return false;
}

void wbt_fs_wait(struct request_queue *q, struct writeback_control *wbc)
{
	int limit;
	DEFINE_WAIT(wait);
	struct rq_qos *rqos = wbt_rq_qos(q);
	struct rq_wb *rwb = RQWB(rqos);
	struct rq_wait *rqw = get_rq_wait(rwb);

	limit = (int)wbt_get_wbc_limit(rwb, wbc);
	/*
	 * inc it here even if disabled, since we'll dec it at completion.
	 * this only happens if the task was sleeping in __wbt_wait(),
	 * and someone turned it off at the same time.
	 */
	if (!rwb_enabled(rwb) || atomic_read(&rqw->inflight) < limit)
		return;

	do {
		prepare_to_wait_exclusive(&rqw->wait, &wait,
						TASK_UNINTERRUPTIBLE);

		limit = (int)wbt_get_wbc_limit(rwb, wbc);
		if (!rwb_enabled(rwb) || atomic_read(&rqw->inflight) < limit)
			break;

		io_schedule();
	} while (1);

	finish_wait(&rqw->wait, &wait);
}

