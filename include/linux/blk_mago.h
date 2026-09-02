#ifndef _LINUX_BLKMAGO_H
#define _LINUX_BLKMAGO_H


enum block_dev_status {
	BLOCK_DEV_STATUS_IDLE   = 0,
	BLOCK_DEV_STATUS_NORMAL = 1,
	BLOCK_DEV_STATUS_BUSY   = 2
};

struct block_dev_dyn_info {
	unsigned int sched_tags;
	unsigned int hw_tags;
	unsigned int inflight_in_queue;   // do we need two inflights
	unsigned int inflight_in_disk;
	unsigned int read_status;         // enum block_dev_status
	unsigned int write_status;        // enum block_dev_status
	unsigned int avg_io_rlatency;     // read avarage latency
	unsigned int max_io_rlatency;     // read max latency
	unsigned int avg_io_wlatency;     // write avarage latency
	unsigned int max_io_wlatency;     // write max latency
};

struct block_dev_healthy_info {
	unsigned long total_times;
	unsigned long expired_times;
};

int block_get_dynamic_info(struct block_device *bdev,
			   struct block_dev_dyn_info *dinfo);

int block_get_healthy_info(struct block_device *bdev,
			   struct block_dev_healthy_info *hinfo);

int block_get_inflight_info(struct block_device *bdev,
			   struct block_dev_dyn_info *dinfo);

#endif