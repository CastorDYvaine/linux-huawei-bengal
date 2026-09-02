/*
 * cam_check_cable.h
 *
 * Check the camera btb cable status.
 *
 * Copyright (c) 2021-2021 Huawei Technologies Co., Ltd.
 *
 * This software is licensed under the terms of the GNU General Public
 * License version 2, as published by the Free Software Foundation, and
 * may be copied, distributed, and modified under those terms.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 */
#ifndef __CAM_CHECK_CABLE_H__
#define __CAM_CHECK_CABLE_H__

#include "cam_sensor_dev.h"

void check_camera_btb_gpio_info(struct cam_sensor_ctrl_t *s_ctrl);

#endif /* __CAM_CHECK_CABLE_H__ */