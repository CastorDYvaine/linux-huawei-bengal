/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
 */

#ifndef _CAM_FLASH_CORE_H_
#define _CAM_FLASH_CORE_H_

#include <media/cam_sensor.h>
#include "cam_flash_dev.h"

struct cam_flash_ctrl;
int cam_flash_publish_dev_info(struct cam_req_mgr_device_info *info);
int cam_flash_establish_link(struct cam_req_mgr_core_dev_link_setup *link);
int cam_flash_apply_request(struct cam_req_mgr_apply_request *apply);
int cam_flash_process_evt(struct cam_req_mgr_link_evt_data *event_data);
int cam_flash_flush_request(struct cam_req_mgr_flush_request *flush);
int32_t flash_handle_mem_ptr(uint64_t handle, struct cam_flash_ctrl *fctrl);
int cam_flash_match_id(struct cam_flash_ctrl *f_ctrl);


#endif /*_CAM_FLASH_CORE_H_*/
