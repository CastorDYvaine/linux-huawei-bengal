/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2021-2021. All rights reserved.
 *
 * Description: cam_torch_test
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

#include "cam_torch_gpio.h"
#include "cam_torch_i2c.h"

void register_test_flashlight_data(struct device *dev)
{
	int rc = 0;

	rc = register_gpio_flashlight_data(dev);
	if (rc < 0)
		pr_err("%s, register_gpio_flashlight_data failed\n", __func__);

	rc = register_i2c_flashlight_data(dev);
	if (rc < 0)
		pr_err("%s, register_i2c_flashlight_data failed\n", __func__);
}