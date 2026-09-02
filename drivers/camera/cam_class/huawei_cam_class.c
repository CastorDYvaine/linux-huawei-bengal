/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2021-2021. All rights reserved.
 *
 * Description: huawei_cam_class
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

#include <linux/device.h>
#include <linux/of.h>
#include <linux/module.h>
#include "chipset_common/camera/cam_class/huawei_cam_class.h"
#include "chipset_common/camera/cam_class/cam_flash_test.h"

#define MAX_CAM_TEST_CLASS_DRIVER_NUM 2

#define CAMERA_TEST_CLASSNAME "camera_class"

static struct class *huawei_cam_class;
static const struct huawei_cam_class_driver *
	huawei_cam_class_drivers[MAX_CAM_TEST_CLASS_DRIVER_NUM];
static int cam_class_driver_count = 0;

int huawei_cam_class_driver_register(
	const struct huawei_cam_class_driver *cam_class_driver)
{
	if (cam_class_driver_count >= MAX_CAM_TEST_CLASS_DRIVER_NUM) {
		pr_err("%s, registered driver num out of range: count = %d\n",
			__func__, cam_class_driver_count);
		return -1;
	}

	huawei_cam_class_drivers[cam_class_driver_count] = cam_class_driver;
	cam_class_driver_count++;

	return 0;
}

static int cam_class_platform_probe(struct platform_device *pdev)
{
	int rc = 0;
	int i;
	int j;

	pr_debug("Probe start\n");

	/* create class */
	huawei_cam_class = class_create(THIS_MODULE, CAMERA_TEST_CLASSNAME);
	if (IS_ERR(huawei_cam_class)) {
		pr_err("%s, Failed to create class\n", __func__);
		return -1;
	}

	/* call subdev probe */
	for (i = 0; i < cam_class_driver_count; i++) {
		rc = huawei_cam_class_drivers[i]->probe(pdev, huawei_cam_class);
		if (rc < 0) {
			pr_err("%s, huawei_cam_class_driver probe failed\n", __func__);
			break;
		}
	}

	/* if fail, remove all created files, then destory class */
	if (rc < 0) {
		for (j = 0; j < i; j++)
			huawei_cam_class_drivers[j]->remove(huawei_cam_class);

		class_destroy(huawei_cam_class);
		return -1;
	}

	return rc;
}

static int cam_class_platform_remove(struct platform_device *dev)
{
	int i;

	for (i = 0; i < cam_class_driver_count; i++)
		huawei_cam_class_drivers[i]->remove(huawei_cam_class);

	class_destroy(huawei_cam_class);
	return 0;
}

static const struct of_device_id cam_class_dt_match[] = {
	{
		.compatible = "huawei,camera-class",
		.data = NULL
	},
	{}
};

MODULE_DEVICE_TABLE(of, cam_class_dt_match);

static struct platform_driver cam_class_platform_driver = {
	.probe = cam_class_platform_probe,
	.remove = cam_class_platform_remove,
	.driver = {
		.name = CAMERA_TEST_CLASSNAME,
		.owner = THIS_MODULE,
		.of_match_table = cam_class_dt_match,
		.suppress_bind_attrs = true,
	},
};

/* init all subclass, these must be called before platform_driver_register */
static int pre_init(void)
{
	int rc;
	rc = flashlight_test_init();
	if (rc < 0) {
		pr_err("%s, flashlight_test_init failed rc: %d\n", __func__, rc);
		return -1;
	}
	return 0;
}

int __init camera_class_init(void)
{
	int rc = 0;

	pr_debug("Init start\n");

	rc = pre_init();
	if (rc < 0) {
		pr_err("%s, subclass_init failed rc: %d\n", __func__, rc);
		return rc;
	}

	rc = platform_driver_register(&cam_class_platform_driver);
	if (rc < 0) {
		pr_err("%s, camera_class_init failed rc: %d\n", __func__, rc);
		return rc;
	}

	pr_debug("Init done\n");

	return 0;
}

void __exit camera_class_exit(void)
{
	pr_debug("Exit start\n");

	platform_driver_unregister(&cam_class_platform_driver);

	pr_debug("Exit done\n");
}

#ifdef BUILDIN_COMMON_CAMERA
module_init(camera_class_init);
module_exit(camera_class_exit);
#endif
MODULE_DESCRIPTION("CAMERA CLASS");
MODULE_LICENSE("GPL v2");
