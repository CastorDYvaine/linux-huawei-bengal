/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2021-2021. All rights reserved.
 *
 * Description: gpio flash light operations
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

#include <linux/leds.h>
#include <linux/gpio.h>
#include "cam_torch_gpio.h"
#include "cam_flash_dev.h"
#include "cam_flash_soc.h"
#include "cam_flash_core.h"
#include "cam_common_util.h"
#include "cam_res_mgr_api.h"
#include "cam_flash_test.h"

enum {
	troch_on_brightness = 100,
	torch_off_brightness = 0,
};

static struct mutex pmic_flash_test_lock;

static void set_cam_torch_switch(struct device *dev, int value)
{
	int brightness;
	struct platform_device *pdev = to_platform_device(dev);
	struct cam_flash_ctrl *fctrl = platform_get_drvdata(pdev);

	if (!fctrl->torch_trigger[0]) {
		CAM_ERR(CAM_FLASH, "torch_trigger is Null");
		return;
	}

	mutex_lock(&pmic_flash_test_lock);
	brightness = (value == LED_ON) ? troch_on_brightness : torch_off_brightness;
	cam_res_mgr_led_trigger_event(fctrl->torch_trigger[0], brightness);
	mutex_unlock(&pmic_flash_test_lock);
}

static void back_cam_torch_turn_on(struct device *dev)
{
	set_cam_torch_switch(dev, LED_ON);
}

static void back_cam_torch_turn_off(struct device *dev)
{
	set_cam_torch_switch(dev, LED_OFF);
}

int register_gpio_flashlight_data(struct device *dev)
{
	int rc;
	struct flashlight_test_operations flashlight_back_ops = {
		.dev = dev,
		.cam_torch_turn_on = back_cam_torch_turn_on,
		.cam_torch_turn_off = back_cam_torch_turn_off,
	};

	rc = cam_flashlight_classdev_register(&flashlight_back_ops, FLASH_LIGHT_BACK, GPIO_CTRL_TYPE);
	if (rc < 0) {
		CAM_ERR(CAM_FLASH, "register classdev failed");
		return rc;
	}

	mutex_init(&pmic_flash_test_lock);

	return 0;
}
