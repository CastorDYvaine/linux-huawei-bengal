/* SPDX-License-Identifier: GPL-2.0 */
/*
 * wl2866d-regulator.h
 *
 * Copyright (c) 2020-2021 Huawei Technologies Co., Ltd.
 *
 * Regulator driver for National Semiconductors wl2866d PMIC chip
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 */

#ifndef __LINUX_REGULATOR_WL2866D_H
#define __LINUX_REGULATOR_WL2866D_H

#include <linux/regulator/machine.h>
#include <linux/platform_device.h>

#define VIN1_1P35_VOL_MIN   1350000
#define VIN1_1P35_VOL_MAX   1350000
#define VIN2_3P3_VOL_MIN    3296000
#define VIN2_3P3_VOL_MAX    3296000

struct wl2866d_chip {
	struct device *dev;
	struct i2c_client *client;
	int en_gpio;
	struct regulator *vin1;
	struct regulator *vin2;
};

struct wl2866d_map {
	u8 reg;
	u8 value;
};

enum {
	OUT_DVDD1,
	OUT_DVDD2,
	OUT_AVDD1,
	OUT_AVDD2,
	VOL_ENABLE,
	VOL_DISABLE,
};
#endif
