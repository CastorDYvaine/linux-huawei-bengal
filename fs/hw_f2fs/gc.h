/* SPDX-License-Identifier: GPL-2.0 */
/*
 * fs/f2fs/gc.h
 *
 * Copyright (c) 2012 Samsung Electronics Co., Ltd.
 *             http://www.samsung.com/
 */
#include <linux/ratelimit.h>

#define F2FS_GC_DSM_INTERVAL      (200 * HZ)
#define F2FS_GC_DSM_BURST         2

#define GC_THREAD_MIN_WB_PAGES		1	/*
						 * a threshold to determine
						 * whether IO subsystem is idle
						 * or not
						 */
#define DEF_GC_THREAD_URGENT_SLEEP_TIME	500	/* 500 ms */
#define DEF_GC_THREAD_MIN_SLEEP_TIME	30000	/* milliseconds */
#define DEF_GC_THREAD_MAX_SLEEP_TIME	60000
#define DEF_GC_THREAD_NOGC_SLEEP_TIME	300000	/* wait 5 min */

#ifdef CONFIG_F2FS_FS_DISK_TURBO
/* choose candidates from sections which has age of more than 7 days */
#define DEF_GC_THREAD_AGE_THRESHOLD		(60 * 60 * 24 * 7)
#define DEF_GC_THREAD_CANDIDATE_RATIO		20	/* select 20% oldest sections as candidates */
#define DEF_GC_THREAD_MAX_CANDIDATE_COUNT	10	/* select at most 10 sections as candidates */
#define DEF_GC_THREAD_AGE_WEIGHT		60	/* age weight */
#define DEFAULT_ACCURACY_CLASS			10000	/* accuracy class */
#endif

#define LIMIT_INVALID_BLOCK	40 /* percentage over total user space */
#define LIMIT_FREE_BLOCK	40 /* percentage over invalid + free space */

#ifdef CONFIG_DISK_MAGO
#define UFS_MIGRATION_LIMIT 	70	/* ufs used space more than 70% will trigger data migration */
#define EMMC_MIGRATION_LIMIT	95	/* emmc used space more than 85% will trigger data migration */
#define MIGRATION_CRITICAL_THRESHOLD 	5	/* avoid repeated data migration between two devices in extreme scenarios */
#define UFS_RECEIVE_LIMIT	(UFS_MIGRATION_LIMIT - MIGRATION_CRITICAL_THRESHOLD)	/* receive data migrated limit*/
#define EMMC_RECEIVE_LIMIT	(EMMC_MIGRATION_LIMIT - MIGRATION_CRITICAL_THRESHOLD)	/* receive data migrated limit*/

#define FILE_CONTINUOUS_MIGRATION_BLK	512
#endif

#define DEF_GC_FAILED_PINNED_FILES	2048

/* Search max. number of dirty segments to select a victim segment */
#define DEF_MAX_VICTIM_SEARCH 4096 /* covers 8GB */

/* GC preferences */
enum {
	GC_LIFETIME = 0,
	GC_BALANCE,
	GC_PERF,
	GC_FRAG
};

struct gc_inode_list {
	struct list_head ilist;
	struct radix_tree_root iroot;
};

#ifdef CONFIG_F2FS_FS_DISK_TURBO
struct victim_info {
	unsigned long long mtime;	/* mtime of section */
	unsigned int segno;		/* section No. */
};

struct victim_entry {
	struct rb_node rb_node;		/* rb node located in rb-tree */
	union {
		struct {
			unsigned long long mtime;	/* mtime of section */
			unsigned int segno;		/* segment No. */
		};
		struct victim_info vi;	/* victim info */
	};
	struct list_head list;
};
#endif

/*
 * inline functions
 */
static inline block_t free_user_blocks(struct f2fs_sb_info *sbi)
{
	if (free_segments(sbi) < overprovision_segments(sbi))
		return 0;
	else
		return (free_segments(sbi) - overprovision_segments(sbi))
			<< sbi->log_blocks_per_seg;
}

static inline block_t limit_invalid_user_blocks(struct f2fs_sb_info *sbi)
{
	return (long)(sbi->user_block_count * LIMIT_INVALID_BLOCK) / 100;
}

static inline block_t limit_free_user_blocks(struct f2fs_sb_info *sbi)
{
	block_t reclaimable_user_blocks = sbi->user_block_count -
		written_block_count(sbi);
	return (long)(reclaimable_user_blocks * LIMIT_FREE_BLOCK) / 100;
}

static inline void increase_sleep_time(struct f2fs_gc_kthread *gc_th,
							unsigned int *wait)
{
	unsigned int min_time = gc_th->min_sleep_time;
	unsigned int max_time = gc_th->max_sleep_time;

	if (*wait == gc_th->no_gc_sleep_time)
		return;

	if ((long long)*wait + (long long)min_time > (long long)max_time)
		*wait = max_time;
	else
		*wait += min_time;
}

static inline void decrease_sleep_time(struct f2fs_gc_kthread *gc_th,
							unsigned int *wait)
{
	unsigned int min_time = gc_th->min_sleep_time;

	if (*wait == gc_th->no_gc_sleep_time)
		*wait = gc_th->max_sleep_time;

	if ((long long)*wait - (long long)min_time < (long long)min_time)
		*wait = min_time;
	else
		*wait -= min_time;
}

static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
{
	block_t invalid_user_blocks = sbi->user_block_count -
					written_block_count(sbi);
	/*
	 * Background GC is triggered with the following conditions.
	 * 1. There are a number of invalid blocks.
	 * 2. There is not enough free space.
	 */
	if (invalid_user_blocks > limit_invalid_user_blocks(sbi) &&
			free_user_blocks(sbi) < limit_free_user_blocks(sbi))
		return true;
	return false;
}

#ifdef CONFIG_DISK_MAGO
enum {
	FAIL_GC = 0,
	SKIP_GC,
	URGENT_GC,
	NORMAL_GC,
};

static inline block_t dev_free_user_blocks(struct f2fs_sb_info *sbi,
			unsigned int dev)
{
	unsigned int free_segs, op_segs;

	if (dev >= DM_DEV_MAX || !f2fs_support_disk_mago(sbi)) {
		free_segs = free_segments(sbi);
		op_segs = overprovision_segments(sbi);
	} else {
		free_segs = FDEV(dev).free_segs;
		op_segs = FDEV(dev).overprovision_segments;
	}

	if (free_segs < op_segs)
		return 0;

	return (free_segs - op_segs) << sbi->log_blocks_per_seg;
}

static inline block_t dev_limit_invalid_user_blocks(struct f2fs_sb_info *sbi,
			unsigned int dev)
{
	if (dev >= DM_DEV_MAX || !f2fs_support_disk_mago(sbi))
		return (long)(sbi->user_block_count * LIMIT_INVALID_BLOCK) / 100;
	else
		return (long)(FDEV(dev).user_block_count * LIMIT_INVALID_BLOCK) / 100;
}

static inline block_t dev_limit_free_user_blocks(struct f2fs_sb_info *sbi,
			unsigned int dev)
{
	block_t reclaimable_user_blocks;

	if (dev >= DM_DEV_MAX || !f2fs_support_disk_mago(sbi))
		reclaimable_user_blocks = sbi->user_block_count -
							written_block_count(sbi);
	else if (FDEV(dev).user_block_count > FDEV(dev).written_valid_blocks)
		reclaimable_user_blocks = FDEV(dev).user_block_count -
							FDEV(dev).written_valid_blocks;
	else
		reclaimable_user_blocks = 0;

	return (long)(reclaimable_user_blocks * LIMIT_FREE_BLOCK) / 100;
}

static inline bool dev_has_enough_invalid_blocks(struct f2fs_sb_info *sbi,
			unsigned int dev)
{
	block_t invalid_user_blocks;

	if (dev >= DM_DEV_MAX || !f2fs_support_disk_mago(sbi))
		invalid_user_blocks = sbi->user_block_count -
					written_block_count(sbi);
	else if (FDEV(dev).user_block_count > FDEV(dev).written_valid_blocks)
		invalid_user_blocks = FDEV(dev).user_block_count -
					FDEV(dev).written_valid_blocks;
	else
		invalid_user_blocks = 0;

	if (invalid_user_blocks > dev_limit_invalid_user_blocks(sbi, dev) &&
			dev_free_user_blocks(sbi, dev) < dev_limit_free_user_blocks(sbi, dev))
		return true;
	/*
	 * Background GC is triggered with the following conditions.
	 * 1. There are a number of invalid blocks.
	 * 2. There is not enough free space.
	 */
	return false;
}
#endif
