/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2021-2021. All rights reserved.
 * Description: camera custom pinctrl class implementation.
 */

#ifndef __CAM_RES_CUSTOM_API_H__
#define __CAM_RES_CUSTOM_API_H__

#include <linux/leds.h>

/**
 * @brief: Get the corresponding pinctrl of dev
 *
 *  Init the shared pinctrl if shared pinctrl enabled.
 *
 * @return None
 */
int cam_res_custom_shared_pinctrl_init(void);

/**
 * @brief: Select the corresponding state
 *
 *  Active state can be selected directly, but need hold to suspend the
 *  pinctrl if the gpios in this pinctrl also held by other pinctrl.
 *
 * @active   : The flag to indicate whether active or suspend
 * the shared pinctrl.
 *
 * @return Status of operation. Negative in case of error. Zero otherwise.
 */
int cam_res_custom_shared_pinctrl_select_state(bool active);

#endif /* __CAM_RES_CUSTOM_API_H__ */
