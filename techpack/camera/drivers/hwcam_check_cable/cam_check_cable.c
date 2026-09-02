/*
 * cam_check_cable.c
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
#include <linux/init.h>
#include <linux/module.h>
#include <linux/delay.h>
#include <linux/of.h>
#include <linux/gpio.h>
#include <linux/of_gpio.h>
#include <linux/slab.h>
#include <linux/device.h>
#include <linux/mutex.h>
#include <linux/platform_device.h>
#include <linux/pinctrl/consumer.h>
#include <linux/pinctrl/pinctrl.h>
#include <linux/device.h>

#include "securec.h"
#include "cam_check_cable.h"
#include "hwcam_hiview.h"
#include "cam_hiview.h"

#define LOG_TAG "[cam_btb_check]"
#define MAX_BTB_CHECK_GPIO_PER_CAM 4
#define MAX_BTB_CHECK_DSMINFO_LENTH 128
#define IMGSENSOR_SENSOR_IDX_MAX_NUM 8
#define IMGSENSOR_SENSOR_IDX_MIN_NUM 0
#define PINCTRL_STRING_LENTH 32
#define GPIO_INIT_VALUE 0xFFFF
#define GPIO_HIGH 1
#define GPIO_LOW 0

static struct pinctrl *g_ppinctrl;

enum PIN_CTRL_STATE {
	PIN_CTRL_STATE_LOW = 0,
	PIN_CTRL_STATE_HIGH,
	PIN_CTRL_STATE_MAX,
};

struct btb_check_gpio_info {
	unsigned int gpio[MAX_BTB_CHECK_GPIO_PER_CAM];
	const char *dsm_notify_info;
	struct pinctrl_state *g_ppinctrl_state[PIN_CTRL_STATE_MAX];
};

static struct btb_check_gpio_info \
	btb_check_gpio_info[IMGSENSOR_SENSOR_IDX_MAX_NUM];

static void get_btb_check_gpio_info_from_dts()
{
	struct device_node *root = NULL;
	struct device_node *child = NULL;
	int gpio_count;
	int gpio_index;
	int ret;
	int i;

	root = of_find_compatible_node(NULL, NULL, "huawei,camera_btb_check");
	if (root == NULL) {
		pr_err(LOG_TAG "get camera_btb_check root node fail!");
		return;
	}

	for_each_child_of_node(root, child) {
		if (child == NULL)
			continue;

		ret = of_property_read_u32_array(child, "index", &gpio_index, 1);
		if (ret < 0) {
			pr_err(LOG_TAG "get child index fail!");
			continue;
		}

		gpio_count = of_property_count_elems_of_size(child,
			"gpio", sizeof(u32));
		if (gpio_count > MAX_BTB_CHECK_GPIO_PER_CAM) {
			pr_err(LOG_TAG "get gpio count %d max!", gpio_count);
			gpio_count = MAX_BTB_CHECK_GPIO_PER_CAM;
		}
		ret = of_property_read_u32_array(child, "gpio",
			(u32 *)&(btb_check_gpio_info[gpio_index].gpio),
			gpio_count);
		if (ret < 0) {
			pr_err(LOG_TAG "get child cam gpio fail!");
			continue;
		}

		ret = of_property_read_string(child, "dsminfo",
			&btb_check_gpio_info[gpio_index].dsm_notify_info);
		if (ret)
			pr_err(LOG_TAG "get child cam dsminfo fail!");
	}

	for (i = 0; i < IMGSENSOR_SENSOR_IDX_MAX_NUM; i++)
		pr_debug(LOG_TAG "imgsensor %d gpio0 %u gpio1 %u dsminfo %s", i,
			btb_check_gpio_info[i].gpio[0],
			btb_check_gpio_info[i].gpio[1],
			btb_check_gpio_info[i].dsm_notify_info);

	return;
}

static void get_pinctrl_state()
{
	char pin_state[PINCTRL_STRING_LENTH];
	int i, j;

	for (i = 0; i < IMGSENSOR_SENSOR_IDX_MAX_NUM; i++) {
		for (j = 0; j < MAX_BTB_CHECK_GPIO_PER_CAM; j++) {
			if (btb_check_gpio_info[i].gpio[j] == GPIO_INIT_VALUE)
				continue;
			if (snprintf_s(pin_state, PINCTRL_STRING_LENTH,
				PINCTRL_STRING_LENTH, "cam%d_btb_check_en_%d",
				i, PIN_CTRL_STATE_LOW) < 0) {
				pr_err(LOG_TAG "snprintf err");
				btb_check_gpio_info[i].gpio[j] = GPIO_INIT_VALUE;
				continue;
			}
			btb_check_gpio_info[i].g_ppinctrl_state[PIN_CTRL_STATE_LOW] =
				pinctrl_lookup_state(g_ppinctrl, pin_state);
			if (IS_ERR(btb_check_gpio_info[i].g_ppinctrl_state[PIN_CTRL_STATE_LOW])) {
				pr_err(LOG_TAG "ERROR: PIN_CTRL_STATE_LOW");
				btb_check_gpio_info[i].gpio[j] = GPIO_INIT_VALUE;
				continue;
			}
			pr_info(LOG_TAG "PIN_CTRL_STATE_LOW index %d %s %p ",
				i, pin_state,
				btb_check_gpio_info[i].g_ppinctrl_state[PIN_CTRL_STATE_LOW]);
			if (snprintf_s(pin_state, PINCTRL_STRING_LENTH,
				PINCTRL_STRING_LENTH, "cam%d_btb_check_en_%d",
				i, PIN_CTRL_STATE_HIGH) < 0) {
				pr_err(LOG_TAG "snprintf err");
				btb_check_gpio_info[i].gpio[j] = GPIO_INIT_VALUE;
				continue;
			}
			btb_check_gpio_info[i].g_ppinctrl_state[PIN_CTRL_STATE_HIGH] =
				pinctrl_lookup_state(g_ppinctrl, pin_state);
			if (IS_ERR(btb_check_gpio_info[i].g_ppinctrl_state[PIN_CTRL_STATE_HIGH])) {
				pr_err(LOG_TAG "ERROR: PIN_CTRL_STATE_HIGH");
				btb_check_gpio_info[i].gpio[j] = GPIO_INIT_VALUE;
				continue;
			}
			pr_info(LOG_TAG "PIN_CTRL_STATE_HIGH index %d %s %d ",
				i, pin_state,
				btb_check_gpio_info[i].g_ppinctrl_state[PIN_CTRL_STATE_HIGH]);
		}
	}
}

static int check_cable(unsigned int cable_gpio,
			struct pinctrl_state* state_high,
			struct pinctrl_state* state_low)
{
	int ret_pullup;
	int ret_pulldown;
	int ret;

	if (state_high == NULL || state_low == NULL) {
		pr_err(LOG_TAG "cable gpio pinctl_state null");
		return 0;
	}

	ret = gpio_request(cable_gpio, NULL);
	if (ret) {
		pr_err(LOG_TAG "cable gpio gpio_request fail");
		return 0;
	}

	pinctrl_select_state(g_ppinctrl, state_high);
	usleep_range(80, 100); /* sleep 80-100 us after set pin state */
	gpio_direction_input(cable_gpio);
	ret_pullup = gpio_get_value(cable_gpio);

	pinctrl_select_state(g_ppinctrl, state_low);
	usleep_range(80, 100); /* sleep 80-100 us after set pin state */
	gpio_direction_input(cable_gpio);
	ret_pulldown = gpio_get_value(cable_gpio);

	gpio_free(cable_gpio);
	pr_info(LOG_TAG "cable gpio %u ret_pullup=%d ret_pulldown = %d",
		cable_gpio, ret_pullup, ret_pulldown);
	if (ret_pullup != ret_pulldown)
		return -EINVAL;

	return 0;
}

static int check_gpio_info(struct btb_check_gpio_info *gpio_info)
{
	unsigned int *gpio_ptr = gpio_info->gpio;
	int ret = 0;
	int i = 0;

	if (gpio_ptr == NULL) {
		pr_err(LOG_TAG "cable gpio is null");
		return 0;
	}

	while (i < MAX_BTB_CHECK_GPIO_PER_CAM &&
		*(gpio_ptr + i) != GPIO_INIT_VALUE) {
		ret = check_cable(*(gpio_ptr + i),
				gpio_info->g_ppinctrl_state[PIN_CTRL_STATE_HIGH],
				gpio_info->g_ppinctrl_state[PIN_CTRL_STATE_LOW]);
		if (ret) {
			pr_err(LOG_TAG "cable gpio %u ret=%d",
				*(gpio_ptr + i), ret);
			break;
		}
		i++;
	}

	if (ret)
		return *(gpio_ptr + i);

	return ret;
}

static void report_dmd_cable_error(
	struct btb_check_gpio_info *cur_node_ptr, struct cam_sensor_ctrl_t *s_ctr)
{
	int sec_ret;
	char content[HIVIEW_MAX_CONTENT_LEN] = {0};

	sec_ret = snprintf_s(content,
		HIVIEW_MAX_CONTENT_LEN, HIVIEW_MAX_CONTENT_LEN - 1,
		"%s", cur_node_ptr->dsm_notify_info);
	if (sec_ret == -1) {
		pr_err(LOG_TAG "sec_ret dsm_notify_info return err");
		return;
	}

	cam_hiview_handle(BTB_CHECK_ERR, s_ctr, content);
}


void check_camera_btb_gpio_info(struct cam_sensor_ctrl_t *s_ctrl)
{
	struct btb_check_gpio_info *cur_node_ptr = NULL;
	int ret;
	int sensor_index = s_ctrl->id;

	if (sensor_index >= IMGSENSOR_SENSOR_IDX_MAX_NUM ||
		sensor_index < IMGSENSOR_SENSOR_IDX_MIN_NUM) {
		pr_err(LOG_TAG "illegal sensor_index");
		return;
	}
	cur_node_ptr = &btb_check_gpio_info[sensor_index];
	if ((cur_node_ptr->gpio)[0] == GPIO_INIT_VALUE) { /* not init. */
		pr_err(LOG_TAG "sensor %d cable gpio not init!", sensor_index);
		return;
	}

	ret = check_gpio_info(cur_node_ptr);
	if (ret)
		report_dmd_cable_error(cur_node_ptr, s_ctrl);
}

static int imgsensor_btb_probe(struct platform_device *pdev)
{
	int i, j;

	pr_info(LOG_TAG "[imgsensor_btb_probe] start\n");
	for (i = 0; i < IMGSENSOR_SENSOR_IDX_MAX_NUM; i++)
		for (j = 0; j < MAX_BTB_CHECK_GPIO_PER_CAM; j++)
			btb_check_gpio_info[i].gpio[j] = GPIO_INIT_VALUE;

	g_ppinctrl = devm_pinctrl_get(&pdev->dev);
	if (IS_ERR(g_ppinctrl)) {
		pr_err(LOG_TAG "%s : Cannot find camera g_ppinctrl!", __func__);
		return -EINVAL;
	}

	get_btb_check_gpio_info_from_dts();
	get_pinctrl_state();
	pr_info(LOG_TAG "[imgsensor_btb_probe] exit\n");

	return 0;
}

static struct of_device_id camera_btb_check_id[] = {
	{ .compatible = "huawei,camera_btb_check", },
	{ },
};
MODULE_DEVICE_TABLE(of, camera_btb_check_id);

static struct platform_driver camera_btb_check_driver = {
	.probe   = imgsensor_btb_probe,
	.driver  = {
		.name  = "image_sensor_btb",
		.owner = THIS_MODULE,
		.of_match_table = of_match_ptr(camera_btb_check_id),
	},
};

static int __init imgsensor_btb_init(void)
{
	return platform_driver_register(&camera_btb_check_driver);
}

static void __exit imgsensor_btb_exit(void)
{
	return platform_driver_unregister(&camera_btb_check_driver);
}

module_init(imgsensor_btb_init);
module_exit(imgsensor_btb_exit);
MODULE_LICENSE("GPL v2");
MODULE_DESCRIPTION("HUAWEI Camera Cable Check Driver");
MODULE_AUTHOR("HUAWEI Inc");

