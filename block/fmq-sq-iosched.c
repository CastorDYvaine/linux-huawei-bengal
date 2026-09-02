/*
 *  FG-awared MQ IO scheduler.
 *
 *  Copyright (C) 2020 Huawei Technologies Co., Ltd. All rights reserved.
 *
 *  Jason Yan <yanaijie@huawei.com>
 *  Yufen Yu <yuyufen@huawei.com>
 *
 */
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/blkdev.h>
#include <linux/blk-mq.h>
#include <linux/elevator.h>
#include <linux/bio.h>
#include <linux/module.h>
#include <linux/slab.h>
#include <linux/init.h>
#include <linux/compiler.h>
#include <linux/rbtree.h>
#include <linux/sbitmap.h>
#include <linux/blk-cgroup.h>
#include <linux/hrtimer.h>
#include <linux/ktime.h>
#include <securec.h>

#include "blk.h"
#include "blk-mq.h"
#include "blk-mq-debugfs.h"
#include "blk-mq-tag.h"
#include "blk-mq-sched.h"

/* The limit for FG and BG queue when vip or fg dispatch is busy */
#define VIP_BUSY_KBG_LIMIT	26
#define VIP_FG_BUSY_BG_LIMIT	24
#define VIP_FG_IDLE_BG_LIMIT	28
#define VIP_IDEL_KBG_LIMIT	28

#define VIP_IDLE_EXPIRED	(HZ / 5)
#define FMQ_REQ_EXPIRED		(HZ / 2)

#define RQ_FMQQ(rq)		((enum queue_type) (rq)->elv.priv[0])
#define RQ_FMQS(rq)		((enum rq_status) (rq)->elv.priv[1])

#define IDLE_TIME_MS		1
#define IDLE_ENABLE_TIME_MS 	5
#define MAX_MSG_LEN 		64

enum queue_type {
	FMQ_QUEUE_VIP,
	FMQ_QUEUE_TA,
	FMQ_QUEUE_FG,
	FMQ_QUEUE_KBG,
	FMQ_QUEUE_BG,
	FMQ_QUEUE_ASYNC,
	FMQ_QUEUE_NR
};

enum rq_status {
	FMQ_RQ_IDLE,
	FMQ_RQ_INLIST,
	FMQ_RQ_INFLIGHT,
};

struct idle_data {
	struct hrtimer hr_timer;
	struct work_struct idle_work;
	bool begin_idling;
};

struct fmq_io_stat {
	/*
	 * These are debug data so we did not add any locks or use atomic
	 * variables. Just for some kind of hint.
	 */
	unsigned long	all_delay;
	unsigned long	all_cnt;
	unsigned long	max_wait;
	unsigned long	max_inq;
	unsigned long	avg_wait;
	unsigned long	wait1;
	unsigned long	wait2;
	unsigned long	wait3;
	unsigned long	wait4;
};

struct fmq_queue {
	struct list_head	fifo_list;
	spinlock_t		lock;
	atomic_t		inlist;
	atomic_t		inflight;
	int			limit;
	struct fmq_io_stat	stat;
	u64			fifo_time;
	enum queue_type		qtype;
	struct fmq_data		*fd;
	struct request		*last;
};

struct fmq_data {
	/*
	 * run time data
	 */
	struct fmq_queue queue[FMQ_QUEUE_NR];	/* Different queues */
	bool		vip_busy;		/* is vip busy */
	unsigned long	vip_idle_expire;	/* vip idle expire time */

	bool		vip_fg_busy;		/* is vip & bg busy */
	unsigned long	vip_fg_idle_expire;	/* vip & bg idle expire time */

	atomic_t	inlist;			/* all rqs in our queues */
	atomic_t	inflight;		/* all rqs inflight */

	spinlock_t	lock;			/* lock the dispatch queue */
	struct list_head dispatch;		/* dispatch queue */
	struct request_queue *q;		/* request queue link */

	atomic_t	tm_cnt;			/* time out count */
	bool		is_last_timeout;	/* is the last rq timeout */
	int		queue_depth;		/* queue depth */
	s64 last_read_insert_time;
	int idle_time_ms;
	int bg_limit;
	int idle_enable_time_ms;
	struct idle_data queue_idle;
};

typedef bool (*fmq_dispatch_throttle)(struct fmq_queue *fq, int busy);

static int fmq_queue_limit[FMQ_QUEUE_NR] = {
	INT_MAX,
	30,
	30,
	28,
	28,
	28,
};

int blkcg_to_queue[5][2] = {
/* read  write */
	{1, 2}, // BLK_THROTL_TA
	{2, 3}, // BLK_THROTL_FG
	{3, 4}, // BLK_THROTL_KBG
	{4, 5}, // BLK_THROTL_SBG
	{4, 5}, // BLK_THROTL_BG
};

static void dispath_queue(struct work_struct *work)
{
	struct idle_data *data = container_of(work, struct idle_data, idle_work);
	struct fmq_data *fd = container_of(data, struct fmq_data, queue_idle);
	blk_run_queue(fd->q);
}

static enum hrtimer_restart fmq_idle_hrtimer_fn(struct hrtimer *hr_timer)
{
	struct idle_data *data = container_of(hr_timer, struct idle_data,
		hr_timer);
	struct fmq_data *fd = container_of(data, struct fmq_data, queue_idle);
	fd->queue_idle.begin_idling = false;
	if (atomic_read(&fd->inlist) > 0)
		kblockd_schedule_work(&data->idle_work);
	return HRTIMER_NORESTART;
}

static void fmq_set_rq_status(struct request *rq, enum rq_status status)
{
	rq->elv.priv[1] = (void *)status;
}

static enum queue_type fmq_get_queue_type(struct bio *bio, unsigned int op)
{
	enum queue_type qtype = FMQ_QUEUE_VIP;
	struct blkcg *blkcg = NULL;
	int rbio = 0;

	if (!bio)
		return qtype;

	if (op & REQ_META)
		return (op & REQ_VIP) ? FMQ_QUEUE_VIP : FMQ_QUEUE_TA;

	if (op_is_discard(op))
		return FMQ_QUEUE_ASYNC;

	if (!op_is_sync(op))
		return FMQ_QUEUE_ASYNC;

	rcu_read_lock();
	rbio = (op & REQ_OP_MASK) == REQ_OP_READ ? 0 : 1;
	blkcg = bio_blkcg(bio);
	if (blkcg->type < FMQ_QUEUE_ASYNC)
		qtype = blkcg_to_queue[blkcg->type][rbio];
	else
		qtype = (rbio == 0 ? FMQ_QUEUE_KBG : FMQ_QUEUE_BG);

	if (!blkcg->css.parent)
		qtype = (rbio == 0 ? FMQ_QUEUE_KBG : FMQ_QUEUE_BG);

	if (op & REQ_VIP)
		qtype = FMQ_QUEUE_VIP;

	rcu_read_unlock();

	return qtype;
}

/*
 * We provide this function to smartIO to get number of request
 * issued into driver but not finish.
 */
static int fmq_get_queue_inflight(struct request_queue *q, enum queue_type type)
{
	struct fmq_data *fd = q->elevator->elevator_data;
	struct fmq_queue *fq = NULL;

	if (type >= FMQ_QUEUE_NR)
		return -EINVAL;

	fq = &fd->queue[type];
	return atomic_read(&fq->inflight);
}


/*
 * Control the hw queue depth of foreground process if the vip process is busy.
 * After the vip queue idle for VIP_IDLE_EXPIRED, restore the queue
 * depth of foreground process.
 */
static void fmq_fg_control(struct fmq_data *fd)
{
	struct fmq_queue *vq = &fd->queue[FMQ_QUEUE_VIP];
	struct fmq_queue *kq = &fd->queue[FMQ_QUEUE_KBG];

	if (fd->vip_busy) {
		if (atomic_read(&vq->inflight) == 0) {
			fd->vip_busy = false;
			fd->vip_idle_expire = jiffies + VIP_IDLE_EXPIRED;
		}
		return;
	}

	if (atomic_read(&vq->inflight) > 0) {
		fd->vip_busy = true;
		kq->limit = VIP_BUSY_KBG_LIMIT;
	} else if (time_after(jiffies, fd->vip_idle_expire)) {
		kq->limit = VIP_IDEL_KBG_LIMIT;
	}
}

static void fmq_set_bg_limit(struct fmq_data *fd, int limit)
{
	struct fmq_queue *fq = NULL;
	int i;

	for (i = FMQ_QUEUE_BG; i < FMQ_QUEUE_NR; i++) {
		fq = &fd->queue[i];
		fq->limit = limit;
	}
}

/*
 * Control the hw queue depth of background process if the vip or foreground
 * process is busy. After the vip queue idle for VIP_IDLE_EXPIRED, restore
 * the queue depth of background process.
 */
static void fmq_bg_control(struct fmq_data *fd)
{
	struct fmq_queue *vq = &fd->queue[FMQ_QUEUE_VIP];
	struct fmq_queue *tq = &fd->queue[FMQ_QUEUE_TA];

#define VIP_FG_INFLIGHT(vq, tq) \
	(atomic_read(&(vq)->inflight) + atomic_read(&(tq)->inflight))

	if (fd->vip_fg_busy) {
		if (VIP_FG_INFLIGHT(vq, tq) == 0) {
			fd->vip_fg_busy = false;
			fd->vip_fg_idle_expire = jiffies + VIP_IDLE_EXPIRED;
		}
		return;
	}

	if (VIP_FG_INFLIGHT(vq, tq) > 0) {
		fd->vip_fg_busy = true;
		fmq_set_bg_limit(fd, fd->bg_limit);
	} else if (time_after(jiffies, fd->vip_fg_idle_expire)) {
		fmq_set_bg_limit(fd, VIP_FG_IDLE_BG_LIMIT);
	}
}

static inline void fmq_queue_control(struct fmq_data *fd)
{
	fmq_fg_control(fd);
	fmq_bg_control(fd);
}

static void fmq_queue_inflight_inc(struct fmq_queue *fq)
{
	atomic_inc(&fq->inflight);
	fmq_queue_control(fq->fd);
}

static void fmq_queue_inflight_dec(struct fmq_queue *fq)
{
	atomic_dec(&fq->inflight);
	fmq_queue_control(fq->fd);
}

static int fmq_prepare_request(struct request_queue *q, struct request *rq,
		struct bio *bio,
		gfp_t gfp_mask)
{
	enum queue_type rq_type;

	/* Passthrough requests alloc rq before bio */
	if (bio) {
		rq_type = fmq_get_queue_type(bio, rq->cmd_flags);
		rq->elv.priv[0] = (void *)(long)rq_type;
	} else {
		rq->elv.priv[0] = (void *)FMQ_QUEUE_NR;
	}

	fmq_set_rq_status(rq, FMQ_RQ_IDLE);

	return 0;
}

static struct fmq_queue *fmq_close_request(struct request *rq)
{
	struct fmq_data *fd = rq->q->elevator->elevator_data;
	enum queue_type rq_type = RQ_FMQQ(rq);
	struct fmq_queue *fq = NULL;

	if (RQ_FMQS(rq) != FMQ_RQ_INFLIGHT)
		return NULL;

	atomic_dec(&fd->inflight);

	if (atomic_read(&fd->inflight) == 0 && atomic_read(&fd->inlist) > 0)
		blk_run_queue_async(rq->q);

	if (rq_type >= FMQ_QUEUE_NR)
		return fq;

	fq = &fd->queue[rq_type];
	fmq_queue_inflight_dec(fq);

	return fq;
}

static void fmq_finish_request(struct request *rq)
{
	struct fmq_queue *fq = fmq_close_request(rq);
	unsigned long delay = div_u64(ktime_get_ns() - rq->start_time_ns,
		NSEC_PER_MSEC);

	if (!fq)
		return;

	/* This is only for debugging so we do not add any locks. That is
	 * to say, the data may not be trusty.
	 */
	if (fq->stat.max_wait < delay)
		fq->stat.max_wait = delay;
	/* request delay time in ms from rq init to rq finish. */
	if (delay < 15)		/* within 15ms */
		fq->stat.wait1++;
	else if (delay < 30)	/* between 15ms to 30ms */
		fq->stat.wait2++;
	else if (delay < 100)	/* between 30ms to 100ms */
		fq->stat.wait3++;
	else			/* more than 100ms */
		fq->stat.wait4++;

	fq->stat.all_delay += delay;
	fq->stat.all_cnt++;
	if (fq->stat.all_cnt == 0)
		return;
	fq->stat.avg_wait = fq->stat.all_delay / fq->stat.all_cnt;
}

static void fmq_started_request(struct request_queue *q, struct request *rq)
{
	struct fmq_data *fd = q->elevator->elevator_data;
	enum queue_type rq_type = RQ_FMQQ(rq);
	struct fmq_queue *fq = NULL;
	unsigned long delay;

	if (rq_type >= FMQ_QUEUE_NR)
		return;

	fq = &fd->queue[rq_type];

	delay = div_u64(ktime_get_ns() - rq->start_time_ns, NSEC_PER_MSEC);
	if (fq->stat.max_inq < delay)
		fq->stat.max_inq = delay;
}

static void fmq_insert_request(struct request_queue *q, struct request *rq)
{
	enum queue_type rq_type = RQ_FMQQ(rq);
	struct fmq_data *fd = q->elevator->elevator_data;
	struct fmq_queue *fq = NULL;
	s64 diff_ms;

	/* queue tags is not ready when elevator init, so get it here  */
	if (fd->queue_depth == 0 && q->queue_tags)
		fd->queue_depth = q->queue_tags->max_depth;

	if (blk_rq_is_passthrough(rq)) {
		spin_lock(&fd->lock);
		list_add_tail(&rq->queuelist, &fd->dispatch);
		fmq_set_rq_status(rq, FMQ_RQ_INLIST);
		spin_unlock(&fd->lock);

		atomic_inc(&fd->inlist);
		return;
	}
	/*
	 * set expire time and add to different type of queue
	 */
	rq->fifo_time = jiffies + FMQ_REQ_EXPIRED;

	fq = &fd->queue[rq_type];

	spin_lock(&fq->lock);
	list_add_tail(&rq->queuelist, &fq->fifo_list);
	fmq_set_rq_status(rq, FMQ_RQ_INLIST);
	fq->last = rq;

	if (atomic_read(&fq->inlist) == 0 ||
		time_after((unsigned long)fq->fifo_time,
			(unsigned long)rq->fifo_time))
		fq->fifo_time = rq->fifo_time;

	spin_unlock(&fq->lock);

	atomic_inc(&fq->inlist);
	atomic_inc(&fd->inlist);
	if (rq_type == FMQ_QUEUE_VIP || rq_type == FMQ_QUEUE_TA ||
		rq_type == FMQ_QUEUE_FG) {
		if (hrtimer_active(&fd->queue_idle.hr_timer))
			hrtimer_try_to_cancel(&fd->queue_idle.hr_timer);
		diff_ms = ktime_to_ms(ktime_sub(ktime_get(),
			fd->last_read_insert_time));
		if (unlikely(diff_ms < 0)) {
			fd->queue_idle.begin_idling = false;
			return;
		}
		if (diff_ms < fd->idle_enable_time_ms)
			fd->queue_idle.begin_idling = true;
		else
			fd->queue_idle.begin_idling = false;

		fd->last_read_insert_time = ktime_get();
	}
}

static void fmq_start_request(struct fmq_data *fd, struct request *rq)
{
	atomic_dec(&fd->inlist);
	atomic_inc(&fd->inflight);
	fmq_set_rq_status(rq, FMQ_RQ_INFLIGHT);
}

static struct request *fmq_dispatch_passthrough(struct fmq_data *fd)
{
	struct request *rq = NULL;

	if (list_empty_careful(&fd->dispatch))
		return NULL;

	spin_lock(&fd->lock);

	if (list_empty(&fd->dispatch)) {
		spin_unlock(&fd->lock);
		return NULL;
	}

	rq = list_first_entry(&fd->dispatch, struct request, queuelist);
	list_del_init(&rq->queuelist);

	fmq_start_request(fd, rq);

	spin_unlock(&fd->lock);
	return rq;
}

static void __fmq_remove_request(struct fmq_queue *fq, struct request *rq,
				 bool first)
{
	struct request *next = NULL;

	list_del_init(&rq->queuelist);
	if (rq == fq->last)
		fq->last = NULL;

	if (first && !list_empty(&fq->fifo_list)) {
		next = list_first_entry(&fq->fifo_list, struct request,
					queuelist);
		fq->fifo_time = next->fifo_time;
	}

	atomic_dec(&fq->inlist);
}

static struct request *fmq_remove_request(struct fmq_queue *fq, bool timeout)
{
	struct request *rq = NULL;

	spin_lock(&fq->lock);

	if (list_empty(&fq->fifo_list)) {
		spin_unlock(&fq->lock);
		return NULL;
	}

	rq = list_first_entry(&fq->fifo_list, struct request, queuelist);

	/* Don't timeout actually */
	if (timeout && time_is_after_jiffies((unsigned long)rq->fifo_time)) {
		if (time_after((unsigned long)fq->fifo_time,
			       (unsigned long)rq->fifo_time))
			fq->fifo_time = rq->fifo_time;
		spin_unlock(&fq->lock);
		return NULL;
	}

	__fmq_remove_request(fq, rq, true);
	fmq_queue_inflight_inc(fq);

	if (timeout) {
		fq->fd->is_last_timeout = true;
		atomic_inc(&fq->fd->tm_cnt);
	} else {
		fq->fd->is_last_timeout = false;
	}

	fmq_start_request(fq->fd, rq);

	spin_unlock(&fq->lock);

	return rq;
}

static struct request *fmq_dispatch_queue(struct fmq_data *fd)
{
	struct request *rq = NULL;
	int i;
	for (i = 0; i <= FMQ_QUEUE_FG; i++) {
		struct fmq_queue *fq = &fd->queue[i];

		if (atomic_read(&fd->inflight) >= fq->limit)
			continue;
		rq = fmq_remove_request(fq, false);
		if (rq) {
			if (hrtimer_active(&fd->queue_idle.hr_timer))
				hrtimer_try_to_cancel(&fd->queue_idle.hr_timer);
			return rq;
		}
	}

	if (hrtimer_active(&fd->queue_idle.hr_timer))
		return NULL;
	if (fd->queue_idle.begin_idling) {
		hrtimer_start(&fd->queue_idle.hr_timer,
			ktime_set(0, fd->idle_time_ms * NSEC_PER_MSEC),
				HRTIMER_MODE_REL);
		return NULL;
	}

	for (i = FMQ_QUEUE_KBG; i < FMQ_QUEUE_NR; i++) {
		struct fmq_queue *fq = &fd->queue[i];
		if (atomic_read(&fd->inflight) >= fq->limit)
			continue;

		rq = fmq_remove_request(fq, false);
		if (rq)
			break;
	}
	return rq;
}

static struct request *fmq_dispatch_timeout(struct fmq_data *fd)
{
	struct request *rq = NULL;
	int i;

	/*
	 * To avoid timeout requests congest the hardware queue, we dispatch
	 * timeout requests and normal requests alternately.
	 */
	if (fd->is_last_timeout)
		return NULL;

	for (i = 0; i < FMQ_QUEUE_NR; i++) {
		struct fmq_queue *fq = &fd->queue[i];
		if (atomic_read(&fq->inlist) == 0)
			continue;
		if (time_is_after_jiffies((unsigned long)fq->fifo_time))
			continue;

		rq = fmq_remove_request(fq, true);
		if (rq) {
			pr_info("Remove timeout request (%llu, %lu) from %d\n",
					rq->fifo_time, jiffies, fq->qtype);
			return rq;
		}
	}

	return NULL;
}

static int fmq_dispatch_requests(struct request_queue *q, int force)
{
	struct fmq_data *fd = q->elevator->elevator_data;
	struct request *rq = NULL;

	rq = fmq_dispatch_passthrough(fd);
	if (rq)
		goto dispatch_request;

	rq = fmq_dispatch_timeout(fd);
	if (rq)
		goto dispatch_request;

	rq = fmq_dispatch_queue(fd);
	if (!rq)
		return 0;

dispatch_request:
	elv_dispatch_add_tail(q, rq);
	return 1;
}

static int fmq_may_queue(struct request_queue *q, unsigned int op)
{
	struct fmq_data *fd = q->elevator->elevator_data;
	enum queue_type rq_type = fmq_get_queue_type(q->cur_bio, op);
	int limit = q->nr_requests;

	switch (rq_type) {
	case FMQ_QUEUE_TA:
	case FMQ_QUEUE_FG:
		limit = limit - (limit * 1 / 8); /* total of 7 / 8 */
		break;
	case FMQ_QUEUE_KBG:
		limit = limit - (limit / 4); /* total of 6 / 8 */
		break;
	case FMQ_QUEUE_BG:
		limit = limit - (limit * 3 / 8); /* total of 5 / 8 */
		break;
	case FMQ_QUEUE_ASYNC:
		limit = limit / 2; /* total of 4 / 8 */
		break;
	default:
		break;
	}

	if (atomic_read(&fd->inflight) + atomic_read(&fd->inlist) >= limit)
		return ELV_MQUEUE_NO;

	return ELV_MQUEUE_MAY;
}

static void fmq_merged_requests(struct request_queue *q, struct request *rq,
				 struct request *next)
{
	struct fmq_data *fd = q->elevator->elevator_data;
	struct fmq_queue *fq = &fd->queue[RQ_FMQQ(rq)];
	struct request *first;

	first = list_first_entry(&fq->fifo_list, struct request, queuelist);

	__fmq_remove_request(fq, next, next == first);
	fmq_set_rq_status(rq, FMQ_RQ_IDLE);
	atomic_dec(&fd->inlist);
}

static int fmq_allow_rq_merge(struct request_queue *q, struct request *rq,
			      struct request *next)
{
	return RQ_FMQQ(rq) == RQ_FMQQ(next);
}

static int fmq_allow_bio_merge(struct request_queue *q, struct request *rq,
			       struct bio *bio)
{
	return fmq_get_queue_type(bio, rq->cmd_flags) == RQ_FMQQ(rq);
}

static int fmq_init_queue(struct request_queue *q, struct elevator_type *e)
{
	struct elevator_queue *eq = NULL;
	struct fmq_data *fd = NULL;
	int i;

	eq = elevator_alloc(q, e);
	if (!eq)
		return -ENOMEM;

	fd = kzalloc_node(sizeof(*fd), GFP_KERNEL, q->node);
	if (!fd) {
		kobject_put(&eq->kobj);
		return -ENOMEM;
	}
	eq->elevator_data = fd;

	for (i = 0; i < FMQ_QUEUE_NR; i++) {
		fd->queue[i].limit = fmq_queue_limit[i];
		fd->queue[i].qtype = i;
		fd->queue[i].fd = fd;
		INIT_LIST_HEAD(&fd->queue[i].fifo_list);
		spin_lock_init(&fd->queue[i].lock);
	}

	spin_lock_init(&fd->lock);
	INIT_LIST_HEAD(&fd->dispatch);
	fd->q = q;
	fd->bg_limit = VIP_FG_BUSY_BG_LIMIT;
	fd->idle_time_ms = IDLE_TIME_MS;
	fd->idle_enable_time_ms = IDLE_ENABLE_TIME_MS;
	fd->last_read_insert_time = ktime_set(0, 0);
	hrtimer_init(&fd->queue_idle.hr_timer, CLOCK_MONOTONIC,
		HRTIMER_MODE_REL);
	fd->queue_idle.hr_timer.function = &fmq_idle_hrtimer_fn;
	INIT_WORK(&fd->queue_idle.idle_work, dispath_queue);
	q->elevator = eq;
	q->get_inflight_rq_fn = fmq_get_queue_inflight;

	return 0;
}

static void fmq_exit_queue(struct elevator_queue *e)
{
	struct fmq_data *fd = e->elevator_data;

	WARN_ON(atomic_read(&fd->inlist) > 0);
	fd->q->get_inflight_rq_fn = NULL;
	if (hrtimer_cancel(&fd->queue_idle.hr_timer))
		pr_info("%s(): fmq idle timer was active!", __func__);
	kfree(fd);
}

/*
 * sysfs parts below
 */
static ssize_t fmq_var_store(unsigned long *var, const char *page, size_t count)
{
	int err;
	err = kstrtoul(page, 10, var);
	return (err == 0 ? count : -EINVAL);
}

#define SHOW_FUNCTION_QUEUE(__FUNC, __VAR)				 \
static ssize_t fmq_##__FUNC##_show(struct elevator_queue *e, char *page) \
{									 \
	struct fmq_data *fd = e->elevator_data;			\
	int off = 0;                                            \
	int i;                                                  \
	for (i = 0; i < FMQ_QUEUE_NR; i++) {                    \
		struct fmq_queue *fq = &fd->queue[i];           \
		off += sprintf_s(page + off, MAX_MSG_LEN, "%d: %d\n", i, __VAR); \
	}                                                       \
	return off;                                             \
}

SHOW_FUNCTION_QUEUE(queue_limit, fq->limit);
SHOW_FUNCTION_QUEUE(queue_inflight, atomic_read(&fq->inflight));
SHOW_FUNCTION_QUEUE(queue_inlist, atomic_read(&fq->inlist));

static ssize_t fmq_queue_stat_show(struct elevator_queue *e, char *page)
{
	struct fmq_data *fd = e->elevator_data;
	int off = 0;
	int i;

#define PERT_WAIT(wait, all)	((all) == 0 ? 0UL : ((wait) * 100UL / (all)))

	for (i = 0; i < FMQ_QUEUE_NR; i++) {
		struct fmq_io_stat *stat = &fd->queue[i].stat;
		off += sprintf_s(page + off, MAX_MSG_LEN,
			"%d : max_wait:  %lu\n", i, stat->max_wait);
		off += sprintf_s(page + off, MAX_MSG_LEN,
			"  : max_inq:   %lu\n", stat->max_inq);
		off += sprintf_s(page + off, MAX_MSG_LEN,
			"  : avg_wait:  %lu\n", stat->avg_wait);
		off += sprintf_s(page + off, MAX_MSG_LEN,
			"  : (<15  ):   %lu(%lu%%)\n",
			stat->wait1, PERT_WAIT(stat->wait1, stat->all_cnt));
		off += sprintf_s(page + off, MAX_MSG_LEN,
			"  : (<30  ):   %lu(%lu%%)\n",
			stat->wait2, PERT_WAIT(stat->wait2, stat->all_cnt));
		off += sprintf_s(page + off, MAX_MSG_LEN,
			"  : (<100 ):   %lu(%lu%%)\n",
			stat->wait3, PERT_WAIT(stat->wait3, stat->all_cnt));
		off += sprintf_s(page + off, MAX_MSG_LEN,
			"  : (>100 ):   %lu(%lu%%)\n",
			stat->wait4, PERT_WAIT(stat->wait4, stat->all_cnt));
		off += sprintf_s(page + off, MAX_MSG_LEN,
			"  : all_delay: %lu\n", stat->all_delay);
		off += sprintf_s(page + off, MAX_MSG_LEN,
			"  : all_cnt:   %lu\n", stat->all_cnt);
	}
	return off;
}

#define SHOW_FUNCTION(__FUNC, __VAR)				 \
static ssize_t fmq_##__FUNC##_show(struct elevator_queue *e, char *page) \
{									 \
	struct fmq_data *fd = e->elevator_data;			\
	int off = 0;                                            \
	off += sprintf_s(page + off, MAX_MSG_LEN, "%d\n", __VAR);	\
	return off;                                             \
}

SHOW_FUNCTION(inflight, atomic_read(&fd->inflight));
SHOW_FUNCTION(inlist, atomic_read(&fd->inlist));
SHOW_FUNCTION(queue_depth, fd->queue_depth);
SHOW_FUNCTION(timeout,  atomic_read(&fd->tm_cnt));

#define STORE_FUNCTION(__FUNC, __PTR, MIN, MAX) 		   \
	static ssize_t fmq_##__FUNC##_store(struct elevator_queue *e,	   \
		   const char *page, size_t count)			   \
	{								   \
	   struct fmq_data *fd = e->elevator_data;		   \
	   unsigned long __data = 0;					   \
	   int ret = fmq_var_store(&__data, (page), count); 	   \
	   if (__data < (MIN))					   \
		   __data = (MIN);					   \
	   else if (__data > (MAX)) 				   \
		   __data = (MAX);					   \
	   *(__PTR) = (int)__data;					   \
	   return ret;						   \
	}

STORE_FUNCTION(idle_time_ms, &fd->idle_time_ms, 0, INT_MAX);
STORE_FUNCTION(bg_limit, &fd->bg_limit, 0, INT_MAX);
STORE_FUNCTION(idle_enable_time_ms, &fd->idle_enable_time_ms, 0, INT_MAX);

SHOW_FUNCTION(idle_time_ms, fd->idle_time_ms);
SHOW_FUNCTION(bg_limit, fd->bg_limit);
SHOW_FUNCTION(idle_enable_time_ms, fd->idle_enable_time_ms);

#define FMQ_ATTR(name) \
	__ATTR(name, S_IRUGO|S_IWUSR, fmq_##name##_show, fmq_##name##_store)

#define FMQ_ATTR_RO(name) \
	__ATTR(name, S_IRUGO, fmq_##name##_show, NULL)

static struct elv_fs_entry fmq_attrs[] = {
	FMQ_ATTR_RO(queue_limit),
	FMQ_ATTR_RO(queue_inflight),
	FMQ_ATTR_RO(queue_inlist),
	FMQ_ATTR_RO(queue_stat),
	FMQ_ATTR_RO(inflight),
	FMQ_ATTR_RO(inlist),
	FMQ_ATTR_RO(queue_depth),
	FMQ_ATTR_RO(timeout),
	FMQ_ATTR(idle_time_ms),
	FMQ_ATTR(bg_limit),
	FMQ_ATTR(idle_enable_time_ms),
	__ATTR_NULL
};

static struct elevator_type fmq_iosched = {
	.ops.sq = {
		.elevator_add_req_fn		= fmq_insert_request,
		.elevator_dispatch_fn		= fmq_dispatch_requests,
		.elevator_init_fn		= fmq_init_queue,
		.elevator_exit_fn		= fmq_exit_queue,
		.elevator_set_req_fn		= fmq_prepare_request,
		.elevator_put_req_fn		= fmq_finish_request,
		.elevator_activate_req_fn	= fmq_started_request,
		.elevator_may_queue_fn		= fmq_may_queue,
		.elevator_allow_rq_merge_fn	= fmq_allow_rq_merge,
		.elevator_merge_req_fn		= fmq_merged_requests,
		.elevator_allow_bio_merge_fn	= fmq_allow_bio_merge,
	},
	.elevator_attrs = fmq_attrs,
	.elevator_name	= "fmq-sq",
	.elevator_owner	= THIS_MODULE,
};
MODULE_ALIAS("fmq-sq-iosched");

static int __init fmq_init(void)
{
	return elv_register(&fmq_iosched);
}

static void __exit fmq_exit(void)
{
	elv_unregister(&fmq_iosched);
}

module_init(fmq_init);
module_exit(fmq_exit);

MODULE_AUTHOR("Jason Yan <yanaijie@huawei.com>");
MODULE_AUTHOR("Yufen Yu <yuyufen@huawei.com>");
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("FG-awared MQ IO scheduler");
