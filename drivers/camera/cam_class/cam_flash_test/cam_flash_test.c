/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2021-2021. All rights reserved.
 *
 * Description: cam_flash_test
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

#include <linux/fs.h>
#include <linux/of.h>
#include "chipset_common/camera/cam_class/cam_flash_test.h"
#include "chipset_common/camera/cam_class/huawei_cam_class.h"

struct flashlight_test_data {
	bool is_registered;
	bool is_dts_configed;
	bool is_file_created;
	int lightness_value;
	enum flash_ctrl_type ctrl_ype;
	struct flashlight_test_operations ops[MAX_CTRL_TYPE];
};

static struct flashlight_test_data flashlight_data[MAX_FLASH_LIGHT_POS] = {0};
static bool is_flashlight_enable = false;

int cam_flashlight_classdev_register(struct flashlight_test_operations *ops,
	enum flashlight_pos pos, enum flash_ctrl_type ctrl_ype)
{
	if (ops == NULL) {
		pr_err("%s, ops is null\n", __func__);
		return -1;
	}

	flashlight_data[pos].is_registered = true;
	flashlight_data[pos].ops[ctrl_ype].dev = ops->dev;
	flashlight_data[pos].ops[ctrl_ype].cam_torch_turn_on = ops->cam_torch_turn_on;
	flashlight_data[pos].ops[ctrl_ype].cam_torch_turn_off = ops->cam_torch_turn_off;

	return 0;
}
EXPORT_SYMBOL(cam_flashlight_classdev_register);

static ssize_t flash_lighttest_show(struct flashlight_test_data *data, char *buf)
{
	int ret;

	if (!data->is_registered) {
		pr_err("%s, flashlight_test_data not registered\n", __func__);
		return -1;
	}

	ret = sprintf(buf, "%d\n", data->lightness_value);

	pr_debug("%s, flash_lighttest_show, lightness_value = %d", __func__, data->lightness_value);

	return ret;
}

static ssize_t flash_lighttest_store(struct flashlight_test_data *data,
	const char *buf, size_t size)
{
	int length;
	int lightness_value = 0;

	if (!data->is_registered) {
		pr_err("%s, flashlight_test_data not registered\n", __func__);
		return -1;
	}

	length = sscanf(buf, "%d",  &lightness_value);
	if (length != 1) {
		pr_err("%s, failed to parse param\n", __func__);
		return -1;
	}

	data->lightness_value = lightness_value;

	if (lightness_value == 0)
		data->ops[data->ctrl_ype].cam_torch_turn_off(data->ops[data->ctrl_ype].dev);
	else
		data->ops[data->ctrl_ype].cam_torch_turn_on(data->ops[data->ctrl_ype].dev);

	pr_debug("%s, flash_lighttest_store, lightness_value = %d", __func__, lightness_value);
	return size;
}

static ssize_t back_flash_lighttest_store(struct class *cls,
	struct class_attribute *attr, const char *buf, size_t size)
{
	return flash_lighttest_store(&flashlight_data[FLASH_LIGHT_BACK], buf, size);
}

static ssize_t front_flash_lighttest_store(struct class *cls,
	struct class_attribute *attr, const char *buf, size_t size)
{
	return flash_lighttest_store(&flashlight_data[FLASH_LIGHT_FRONT], buf, size);
}

static ssize_t back_flash_lighttest_show(struct class *cls,
	struct class_attribute *attr, char *buf)
{
	return flash_lighttest_show(&flashlight_data[FLASH_LIGHT_BACK], buf);
}

static ssize_t front_flash_lighttest_show(struct class *cls,
	struct class_attribute *attr, char *buf)
{
	return flash_lighttest_show(&flashlight_data[FLASH_LIGHT_FRONT], buf);
}

static const struct class_attribute flash_lighttest_back_attr =
	__ATTR(flash_lighttest_back, 0664, back_flash_lighttest_show,
	back_flash_lighttest_store);

static const struct class_attribute flash_lighttest_front_attr =
	__ATTR(flash_lighttest_front, 0664, front_flash_lighttest_show,
	front_flash_lighttest_store);

static const struct class_attribute flash_lighttest_enable_attr =
	__ATTR(flash_lighttest_enable, 0664, NULL, NULL);

static void fill_flash_ctrl_type(const char *torch_light_ctrl_type, enum flashlight_pos pos)
{
	if (!strcmp(torch_light_ctrl_type, "pmic"))
		flashlight_data[pos].ctrl_ype = PMIC_CTRL_TYPE;

	if (!strcmp(torch_light_ctrl_type, "i2c"))
		flashlight_data[pos].ctrl_ype = I2C_CTRL_TYPE;

	if (!strcmp(torch_light_ctrl_type, "gpio"))
		flashlight_data[pos].ctrl_ype = GPIO_CTRL_TYPE;
}

static int cam_torch_classdev_parse_dt(const struct device_node *of_node)
{
	int rc;
	int light_name_count;
	int ctrl_type_count;
	int i;
	const char *torch_light_names[MAX_FLASH_LIGHT_POS];
	const char *torch_light_ctrl_type[MAX_FLASH_LIGHT_POS];
	struct device_node *flash_test_node = NULL;

	if (of_node == NULL) {
		pr_err("%s, Null ptr\n", __func__);
		return -1;
	}

	flash_test_node = of_parse_phandle(of_node, "camera-flashlight-test-src", 0);
	if (flash_test_node == NULL) {
		pr_err("%s, get camera-flashlight-test-src failed\n", __func__);
		return -1;
	}

	light_name_count = of_property_count_strings(flash_test_node, "torch-light-name");
	if ((light_name_count < 1) || (light_name_count > MAX_FLASH_LIGHT_POS)) {
		pr_err("%s, invalid light_name_count = %d\n", __func__, light_name_count);
		return -1;
	}

	rc = of_property_read_string_array(flash_test_node, "torch-light-name",
		torch_light_names, light_name_count);
	if (rc < 0) {
		pr_warning("%s, read string failed\n", __func__);
		return -1;
	}

	ctrl_type_count = of_property_count_strings(flash_test_node, "torch-light-ctrl-type");
	if ((ctrl_type_count < 1) || (ctrl_type_count > MAX_FLASH_LIGHT_POS) ||
		(ctrl_type_count != light_name_count)) {
		pr_err("%s, invalid ctrl_type_count = %d\n", __func__, ctrl_type_count);
		return -1;
	}

	rc = of_property_read_string_array(flash_test_node, "torch-light-ctrl-type",
		torch_light_ctrl_type, ctrl_type_count);
	if (rc < 0) {
		pr_warning("%s, read string failed\n", __func__);
		return -1;
	}

	for (i = 0; i < light_name_count; i++) {
		if (!strcmp(torch_light_names[i], "torch-light-back")) {
			flashlight_data[FLASH_LIGHT_BACK].is_dts_configed = true;
			fill_flash_ctrl_type(torch_light_ctrl_type[i], FLASH_LIGHT_BACK);
		}
		if (!strcmp(torch_light_names[i], "torch-light-front")) {
			flashlight_data[FLASH_LIGHT_FRONT].is_dts_configed = true;
			fill_flash_ctrl_type(torch_light_ctrl_type[i], FLASH_LIGHT_FRONT);
		}
	}

	pr_info("%s, torch_num: %d\n", __func__, light_name_count);
	return 0;
}

static int32_t cam_flashlight_test_probe(struct platform_device *pdev,
	struct class *huawei_cam_class)
{
	int rc;

	pr_debug("Probe start\n");

	/* parse dt for flashlight test names */
	rc = cam_torch_classdev_parse_dt(pdev->dev.of_node);
	if (rc < 0) {
		pr_warning("%s, Failed to parse dt\n", __func__);
		return -1;
	}

	if (flashlight_data[FLASH_LIGHT_BACK].is_dts_configed) {
		if (class_create_file(huawei_cam_class, &flash_lighttest_back_attr)) {
			pr_err("%s, create files flash_lighttest_back_attr fail\n", __func__);
			return -1;
		}
		flashlight_data[FLASH_LIGHT_BACK].is_file_created = true;
	}

	if (flashlight_data[FLASH_LIGHT_FRONT].is_dts_configed) {
		if (class_create_file(huawei_cam_class, &flash_lighttest_front_attr)) {
			pr_err("%s, create files flash_lighttest_front_attr fail\n", __func__);
			if (flashlight_data[FLASH_LIGHT_BACK].is_file_created)
				class_remove_file(huawei_cam_class, &flash_lighttest_back_attr);
			return -1;
		}
		flashlight_data[FLASH_LIGHT_FRONT].is_file_created = true;
	}

	if (class_create_file(huawei_cam_class, &flash_lighttest_enable_attr)) {
		pr_err("%s, create files flash_lighttest_enable_attr fail\n", __func__);
		if (flashlight_data[FLASH_LIGHT_BACK].is_file_created)
			class_remove_file(huawei_cam_class, &flash_lighttest_back_attr);
		if (flashlight_data[FLASH_LIGHT_FRONT].is_file_created)
			class_remove_file(huawei_cam_class, &flash_lighttest_front_attr);
		return -1;
	}
	is_flashlight_enable = true;

	return 0;
}

static int cam_flashlight_test_remove(struct class *huawei_cam_class)
{
	if (flashlight_data[FLASH_LIGHT_FRONT].is_file_created)
		class_remove_file(huawei_cam_class, &flash_lighttest_front_attr);

	if (flashlight_data[FLASH_LIGHT_BACK].is_file_created)
		class_remove_file(huawei_cam_class, &flash_lighttest_back_attr);

	if (is_flashlight_enable) {
		class_remove_file(huawei_cam_class, &flash_lighttest_enable_attr);
		is_flashlight_enable = false;
	}

	return 0;
}

static const struct huawei_cam_class_driver cam_flash_test_driver = {
	.probe = cam_flashlight_test_probe,
	.remove = cam_flashlight_test_remove,
};

int flashlight_test_init(void)
{
	int rc = 0;

	pr_debug("Init start\n");

	rc = huawei_cam_class_driver_register(&cam_flash_test_driver);
	if (rc < 0) {
		pr_err("%s, flashlight_test_init failed rc: %d\n", __func__, rc);
		return rc;
	}

	pr_debug("Init done\n");

	return 0;
}
