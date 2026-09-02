/* Copyright (c) 2021, The Linux Foundation. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 and
 * only version 2 as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/leds.h>
#include <linux/platform_device.h>
#include <linux/of_gpio.h>
#include <linux/gpio.h>
#include <linux/of.h>
#include <linux/printk.h>
#include <linux/list.h>
#include <linux/pinctrl/consumer.h>
#include <linux/delay.h>

#define LED_GPIO_FLASH_DRIVER_NAME	"qcom,qti_gpio_flash_led"
#define LED_TRIGGER_DEFAULT		"none"
#define GPIO_OUT_LOW          0
#define GPIO_OUT_HIGH         1

enum {
	LED_DEV_DISABLE,
	LED_DEV_ENABLE,
};

enum {
	FLASH_EN,
	FLASH_NOW,
	MAX_FLASH_SEQ_TYPE,
};

struct msm_flash_ctrl_seq {
	uint8_t flash_on_val;
	uint8_t torch_on_val;
};

struct flash_dev_data {
	uint8_t dev_enable;
	uint8_t flash_on_en;
	uint8_t flash_on_now;
	uint8_t flash_off_en;
	uint8_t flash_off_now;
	int brightness_thresh;
	int brightness;
	struct led_classdev cdev;
	struct led_gpio_flash_data *gpio_flash_data;
};

struct led_gpio_flash_data {
	int flash_en_gpio;
	int flash_now_gpio;
	struct flash_dev_data flash_dev; // if more than one flash, this should be an array
	struct flash_dev_data torch_dev; // if more than one torch, this should be an array
	struct pinctrl *pinctrl;
	struct msm_flash_ctrl_seq ctrl_seq[MAX_FLASH_SEQ_TYPE];
};

static void led_gpio_brightness_set(struct led_classdev *led_cdev,
	enum led_brightness brightness)
{
	int rc = 0;
	int en_val = 0, now_val = 0;
	struct flash_dev_data *dev_data =
		container_of(led_cdev, struct flash_dev_data, cdev);
	struct led_gpio_flash_data *flash_led = dev_data->gpio_flash_data;

	if (brightness > dev_data->brightness_thresh) {
		en_val = dev_data->flash_on_en;
		now_val = dev_data->flash_on_now;
	} else {
		en_val = dev_data->flash_off_en;
		now_val = dev_data->flash_off_now;
	}

	rc = gpio_direction_output(flash_led->flash_en_gpio, en_val);
	if (rc) {
		pr_err("%s: Failed to set gpio: %d, en_val = %d\n", __func__,
			flash_led->flash_en_gpio, en_val);
		return;
	}
	rc = gpio_direction_output(flash_led->flash_now_gpio, now_val);
	if (rc) {
		pr_err("%s: Failed to set gpio: %d, now_val: %d\n", __func__,
			flash_led->flash_now_gpio, now_val);
		return;
	}

	dev_data->brightness = brightness;
}
static enum led_brightness led_gpio_brightness_get(struct led_classdev
												*led_cdev)
{
	struct flash_dev_data *dev_data =
		container_of(led_cdev, struct flash_dev_data, cdev);
	return dev_data->brightness;
}

static int led_gpio_flash_register_device(struct platform_device *pdev,
	struct device_node *node, struct led_gpio_flash_data *flash_led)
{
	int rc = 0;
	const char *led_trigger = NULL;
	const char *label = NULL;
	struct flash_dev_data *dev_data = NULL;

	rc = of_property_read_string(node, "label", &label);
	if (rc) {
		pr_err("%s: Failed to read label. rc = %d\n", __func__, rc);
		return rc;
	}

	if (!strcmp("flash", label)) {
		dev_data = &flash_led->flash_dev;
		dev_data->flash_on_en = flash_led->ctrl_seq[FLASH_EN].flash_on_val;
		dev_data->flash_on_now = flash_led->ctrl_seq[FLASH_NOW].flash_on_val;
		dev_data->flash_off_en = 0;
		dev_data->flash_off_now = 0;
	} else if (!strcmp("torch", label)) {
		dev_data = &flash_led->torch_dev;
		dev_data->flash_on_en = flash_led->ctrl_seq[FLASH_EN].torch_on_val;
		dev_data->flash_on_now = flash_led->ctrl_seq[FLASH_NOW].torch_on_val;
		dev_data->flash_off_en = 0;
		dev_data->flash_off_now = 0;
	} else {
		pr_err("%s: unknown label = %s. rc = %d\n", __func__, label, rc);
		return rc;
	}

	rc = of_property_read_string(node, "qcom,led-name", &dev_data->cdev.name);
	if (rc) {
		pr_err("%s: Failed to read linux name. rc = %d\n", __func__, rc);
		return rc;
	}

 	rc = of_property_read_u32(node, "qcom,current-thresh", &dev_data->brightness_thresh);
 	if (rc) {
		pr_err("%s: Failed to read qcom,current-thresh. rc = %d\n", __func__, rc);
		return rc;
 	}

	dev_data->cdev.default_trigger = LED_TRIGGER_DEFAULT;
	rc = of_property_read_string(node, "qcom,default-led-trigger", &led_trigger);
	if (!rc)
		dev_data->cdev.default_trigger = led_trigger;

	dev_data->dev_enable = LED_DEV_DISABLE;
	dev_data->gpio_flash_data = flash_led;
	dev_data->cdev.max_brightness = LED_FULL;
	dev_data->cdev.brightness_set = led_gpio_brightness_set;
	dev_data->cdev.brightness_get = led_gpio_brightness_get;
	rc = led_classdev_register(&pdev->dev, &dev_data->cdev);
	if (rc) {
		pr_err("%s: Failed to register led dev. rc = %d\n", __func__, rc);
		return rc;
	}

	dev_data->dev_enable = LED_DEV_ENABLE;

	return 0;
}

static int led_gpio_flash_remove(struct platform_device *pdev)
{
	struct led_gpio_flash_data *flash_led =
		(struct led_gpio_flash_data *)platform_get_drvdata(pdev);

	if (!IS_ERR(flash_led->pinctrl))
		devm_pinctrl_put(flash_led->pinctrl);

	if (flash_led->flash_dev.dev_enable)
		led_classdev_unregister(&flash_led->flash_dev.cdev);

	if (flash_led->torch_dev.dev_enable)
		led_classdev_unregister(&flash_led->torch_dev.cdev);

	devm_kfree(&pdev->dev, flash_led);
	return 0;
}

static int led_gpio_flash_parse_dt(struct platform_device *pdev, struct led_gpio_flash_data *flash_led)
{
	int rc = 0;
	const char *seq_name = NULL;
	struct device_node *node = pdev->dev.of_node;
	uint32_t array_flash_seq[MAX_FLASH_SEQ_TYPE];
	uint32_t array_torch_seq[MAX_FLASH_SEQ_TYPE];
	int i = 0;

	flash_led->flash_en_gpio = of_get_named_gpio(node, "qcom,flash-en", 0);
	if (flash_led->flash_en_gpio < 0) {
		pr_err("%s: Looking up flash-en property in node %s failed. rc = %d\n",
			__func__, node->full_name, flash_led->flash_en_gpio);
		return -EINVAL;
	} else {
		rc = gpio_request(flash_led->flash_en_gpio, "FLASH_EN");
		if (rc) {
			pr_err("%s: Failed to request gpio %d, rc = %d\n",
				__func__, flash_led->flash_en_gpio, rc);
			return rc;
		}
	}
	flash_led->flash_now_gpio = of_get_named_gpio(node, "qcom,flash-now", 0);
	if (flash_led->flash_now_gpio < 0) {
		pr_err("%s: Looking up flash-now property in node %s failed. rc = %d\n",
			__func__, node->full_name, flash_led->flash_now_gpio);
		return -EINVAL;
	} else {
		rc = gpio_request(flash_led->flash_now_gpio, "FLASH_NOW");
		if (rc) {
			pr_err("%s: Failed to request gpio %d, rc = %d\n",
				__func__, flash_led->flash_now_gpio, rc);
			return rc;
		}
	}

	rc = of_property_read_u32_array(node, "qcom,flash-seq-val",
		array_flash_seq, MAX_FLASH_SEQ_TYPE);
	if (rc) {
		pr_err("%s: get flash op seq failed, rc = %d\n",
			__func__, rc);
		return rc;
	}
	rc = of_property_read_u32_array(node, "qcom,torch-seq-val",
		array_torch_seq, MAX_FLASH_SEQ_TYPE);
	if (rc) {
		pr_err("%s: get torch op seq failed, rc = %d\n",
			__func__, rc);
		return rc;
	}

	for (i = 0; i < MAX_FLASH_SEQ_TYPE; i++) {
		rc = of_property_read_string_index(node, "qcom,op-seq", i, &seq_name);
		if (rc) {
			pr_err("%s: get qcom,op-seq[%d] failed, rc = %d\n",
				__func__, i, rc);
			return rc;
		}

		if (!strcmp(seq_name, "flash_en")) {
			if (array_flash_seq[i] == 0)
				flash_led->ctrl_seq[FLASH_EN].flash_on_val = GPIO_OUT_LOW;
			else
				flash_led->ctrl_seq[FLASH_EN].flash_on_val = GPIO_OUT_HIGH;
			if (array_torch_seq[i] == 0)
				flash_led->ctrl_seq[FLASH_EN].torch_on_val = GPIO_OUT_LOW;
			else
				flash_led->ctrl_seq[FLASH_EN].torch_on_val = GPIO_OUT_HIGH;
		} else if (!strcmp(seq_name, "flash_now")) {
			if (array_flash_seq[i] == 0)
				flash_led->ctrl_seq[FLASH_NOW].flash_on_val = GPIO_OUT_LOW;
			else
				flash_led->ctrl_seq[FLASH_NOW].flash_on_val = GPIO_OUT_HIGH;
			if (array_torch_seq[i] == 0)
				flash_led->ctrl_seq[FLASH_NOW].torch_on_val = GPIO_OUT_LOW;
			else
				flash_led->ctrl_seq[FLASH_NOW].torch_on_val = GPIO_OUT_HIGH;
		}
	}

	return 0;
}

static int led_gpio_flash_probe(struct platform_device *pdev)
{
	int rc = 0;
	struct led_gpio_flash_data *flash_led = NULL;
	struct device_node *node = pdev->dev.of_node;
	struct device_node *temp = NULL;
	struct pinctrl_state *gpio_state_default = NULL;

	flash_led = devm_kzalloc(&pdev->dev, sizeof(struct led_gpio_flash_data),
						GFP_KERNEL);
	if (flash_led == NULL) {
		pr_err("%s: Unable to allocate memory\n", __func__);
		return -ENOMEM;
	}

	flash_led->pinctrl = devm_pinctrl_get(&pdev->dev);
	if (IS_ERR(flash_led->pinctrl)) {
		pr_err("%s:failed to get pinctrl, errorcode = %d\n",
			__func__, PTR_ERR(flash_led->pinctrl));
		goto error;
	}
	gpio_state_default = pinctrl_lookup_state(flash_led->pinctrl,
		"flash_default");
	if (IS_ERR(gpio_state_default)) {
		pr_err("%s:can not get active pinstate\n", __func__);
		goto error;
	}
	rc = pinctrl_select_state(flash_led->pinctrl, gpio_state_default);
	if (rc) {
		pr_err("%s:set state failed!\n", __func__);
		goto error;
	}

	rc = led_gpio_flash_parse_dt(pdev, flash_led);
	if (rc) {
		pr_err("%s:parse dt failed!\n", __func__);
		goto error;
	}

	platform_set_drvdata(pdev, flash_led);

	for_each_available_child_of_node(node, temp) {
		rc = led_gpio_flash_register_device(pdev, temp, flash_led);
		if (rc) {
			pr_err("%s: Failed to register led device, rc = %d\n",
				__func__, rc);
			goto error;
		}
	}

	return 0;
error:
	led_gpio_flash_remove(pdev);
	return -EINVAL;
}

static struct of_device_id led_gpio_flash_of_match[] = {
	{.compatible = LED_GPIO_FLASH_DRIVER_NAME,},
	{},
};

static struct platform_driver led_gpio_flash_driver = {
	.probe = led_gpio_flash_probe,
	.remove = led_gpio_flash_remove,
	.driver = {
		.name = "leds-qti-gpio-flash",
		.owner = THIS_MODULE,
		.of_match_table = led_gpio_flash_of_match,
	}
};

static int __init led_gpio_flash_init(void)
{
	return platform_driver_register(&led_gpio_flash_driver);
}

static void __exit led_gpio_flash_exit(void)
{
	return platform_driver_unregister(&led_gpio_flash_driver);
}

late_initcall(led_gpio_flash_init);
module_exit(led_gpio_flash_exit);

MODULE_DESCRIPTION("QCOM BACK GPIO LEDs driver");
MODULE_LICENSE("GPL v2");
MODULE_ALIAS("leds:leds-qti-gpio-flash");
