/*
 * leds-hw-pwm-flash.c
 *
 * Copyright (c) 2022-2023 Huawei Technologies Co., Ltd.
 *
 * led pwm flash driver
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
#include <linux/pwm.h>

#define LED_PWM_FLASH_DRIVER_NAME	"huawei,hw_pwm_flash_leds"
#define LED_TRIGGER_DEFAULT		"none"

enum {
	LED_DEV_DISABLE,
	LED_DEV_ENABLE,
};

struct flash_dev_data {
	uint8_t dev_enable;
	int brightness_thresh;
	int brightness;
	struct led_classdev cdev;
	struct led_pwm_flash_data *pwm_flash_data;
};

struct led_pwm_flash_data {
	int flash_enm_gpio;
	int flash_enf_gpio;
	uint32_t torch_maxcurrent;
	uint32_t flash_maxcurrent;
	uint32_t pwm_period;
	struct flash_dev_data flash_dev; // if more than one flash, this should be an array
	struct flash_dev_data torch_dev; // if more than one torch, this should be an array
	struct pinctrl *pinctrl;
};
typedef enum {
	PWM_FLASH_STATE_OFF = 0,
	PWM_FLASH_STATE_LOW,
	PWM_FLASH_STATE_HIGH = 255,
} pwm_flash_state;

struct pwm_device *leds_hw_pwm = NULL;

void pwm_flash_current_set(struct led_pwm_flash_data *flash_led, pwm_flash_state state, u64 flash_current)
{
	struct pwm_state pstate;
	int rc = 0;
	pwm_get_state(leds_hw_pwm, &pstate);
	pstate.period = flash_led->pwm_period;
	pr_info("%s: flash_current: %u,period:%u flash_maxcurrent:%d, torch_maxcurrent%d\n",
		__func__, flash_current, pstate.period, flash_led->flash_maxcurrent, flash_led->torch_maxcurrent);
	switch (state) {
	case PWM_FLASH_STATE_HIGH:
		pstate.enabled = true;
		pstate.duty_cycle = pstate.period * flash_current / flash_led->flash_maxcurrent;
		rc = pwm_apply_state(leds_hw_pwm, &pstate);
		pr_info("%s: PWM_FLASH_STATE_HIGH duty_cycle: %u, period: %u rc: %d\n", __func__, pstate.duty_cycle, pstate.period, rc);
		break;
	case PWM_FLASH_STATE_LOW:
		pstate.enabled = true;
		pstate.duty_cycle = pstate.period * flash_current / flash_led->torch_maxcurrent;
		rc = pwm_apply_state(leds_hw_pwm, &pstate);
		pr_info("%s: PWM_FLASH_STATE_LOW duty_cycle: %u, period: %u, rc: %d\n", __func__, pstate.duty_cycle, pstate.period, rc);
		break;
	case PWM_FLASH_STATE_OFF:
		pstate.enabled = false;
		pstate.duty_cycle = 0;
		rc = pwm_apply_state(leds_hw_pwm, &pstate);
		pr_info("%s: PWM_FLASH_STATE_OFF duty_cycle: %u, period: %u, rc: %d\n", __func__, pstate.duty_cycle, pstate.period, rc);
		break;
	default:
		pr_info("%s: PWM_FLASH_STATE default \n", __func__);
	}
}

/* flash_enm_gpio is PWM enm-gpio, flash_enf_gpio is PWM enf-gpio */
static int led_pwm_brightness_set_blocking(struct led_classdev *led_cdev,
	enum led_brightness brightness)
{
	struct flash_dev_data *dev_data =
		container_of(led_cdev, struct flash_dev_data, cdev);
	struct led_pwm_flash_data *flash_led = dev_data->pwm_flash_data;

	if (brightness == PWM_FLASH_STATE_OFF) {
		/* for pwm flash off */
		gpio_direction_output(flash_led->flash_enm_gpio, 0);
		pwm_flash_current_set(flash_led, PWM_FLASH_STATE_OFF, 0);
		gpio_direction_output(flash_led->flash_enf_gpio, 0);
		pr_info("%s: brightness %d flash off\n", __func__, brightness);
	} else if (brightness > 0 && brightness < 255) {
		/* for pwm flash low */
		gpio_direction_output(flash_led->flash_enf_gpio, 0);
		gpio_direction_output(flash_led->flash_enm_gpio, 1);
		usleep_range(5000, 6000); /* delay not less than 5ms */
		gpio_direction_output(flash_led->flash_enm_gpio, 0);
		pwm_flash_current_set(flash_led, PWM_FLASH_STATE_LOW, brightness);
		pr_info("%s: brightness %d flash low\n", __func__, brightness);
	} else if (brightness == PWM_FLASH_STATE_HIGH) {
		/* for pwm flash high */
		pwm_flash_current_set(flash_led, PWM_FLASH_STATE_HIGH, flash_led->flash_maxcurrent);
		usleep_range(1000, 2000);
		gpio_direction_output(flash_led->flash_enf_gpio, 1);
		pr_info("%s: brightness %d flash high\n", __func__, brightness);
	}

	dev_data->brightness = brightness;
	return 0;
}

static enum led_brightness led_pwm_brightness_get(struct led_classdev
												*led_cdev)
{
	struct flash_dev_data *dev_data =
		container_of(led_cdev, struct flash_dev_data, cdev);
	return dev_data->brightness;
}

static int led_pwm_flash_register_device(struct platform_device *pdev,
	struct device_node *node, struct led_pwm_flash_data *flash_led)
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
	} else if (!strcmp("torch", label)) {
		dev_data = &flash_led->torch_dev;
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
	dev_data->pwm_flash_data = flash_led;
	dev_data->cdev.max_brightness = LED_FULL;
	dev_data->cdev.brightness_set_blocking = led_pwm_brightness_set_blocking;
	dev_data->cdev.brightness_get = led_pwm_brightness_get;
	rc = led_classdev_register(&pdev->dev, &dev_data->cdev);
	if (rc) {
		pr_err("%s: Failed to register led dev. rc = %d\n", __func__, rc);
		return rc;
	}
	pr_info("%s: register led dev success. rc = %d\n", __func__, rc);

	dev_data->dev_enable = LED_DEV_ENABLE;

	return 0;
}

static int led_pwm_flash_remove(struct platform_device *pdev)
{
	struct led_pwm_flash_data *flash_led =
		(struct led_pwm_flash_data *)platform_get_drvdata(pdev);

	if (!IS_ERR(flash_led->pinctrl))
		devm_pinctrl_put(flash_led->pinctrl);

	if (flash_led->flash_dev.dev_enable)
		led_classdev_unregister(&flash_led->flash_dev.cdev);

	if (flash_led->torch_dev.dev_enable)
		led_classdev_unregister(&flash_led->torch_dev.cdev);

	devm_kfree(&pdev->dev, flash_led);
	return 0;
}
/* flash_enm_gpio is PWM enm-gpio, flash_enf_gpio is PWM enf-gpio */
static int led_pwm_flash_parse_dt(struct platform_device *pdev, struct led_pwm_flash_data *flash_led)
{
	int rc = 0;
	struct device_node *node = pdev->dev.of_node;

	flash_led->flash_enm_gpio = of_get_named_gpio(node, "huawei,flash_enm_gpio", 0);
	if (flash_led->flash_enm_gpio <= 0) {
		pr_err("%s: Looking up flash-en property in node %s failed. rc = %d\n",
			__func__, node->full_name, flash_led->flash_enm_gpio);
		return -EINVAL;
	} else {
		rc = gpio_request(flash_led->flash_enm_gpio, "FLASH_ENM");
		if (rc) {
			pr_err("%s: Failed to request gpio %d, rc = %d\n",
				__func__, flash_led->flash_enm_gpio, rc);
			return rc;
		}
		pr_info("%s: ok to request gpio %d, rc = %d\n",
				__func__, flash_led->flash_enm_gpio, rc);
	}
	flash_led->flash_enf_gpio = of_get_named_gpio(node, "huawei,flash_enf_gpio", 0);
	if (flash_led->flash_enf_gpio <= 0) {
		pr_err("%s: Looking up flash-now property in node %s failed. rc = %d\n",
			__func__, node->full_name, flash_led->flash_enf_gpio);
		return -EINVAL;
	} else {
		rc = gpio_request(flash_led->flash_enf_gpio, "FLASH_ENF");
		if (rc) {
			pr_err("%s: Failed to request gpio %d, rc = %d\n",
				__func__, flash_led->flash_enf_gpio, rc);
			return rc;
		}
		pr_info("%s: ok to request gpio %d, rc = %d\n",
				__func__, flash_led->flash_enf_gpio, rc);
	}
	rc = of_property_read_u32(node, "torch_maxcurrent", &flash_led->torch_maxcurrent);
	if (rc) {
		pr_err("%s: Failed to read torch_maxcurrent. rc = %d\n", __func__, rc);
		return rc;
	}

	rc = of_property_read_u32(node, "flash_maxcurrent", &flash_led->flash_maxcurrent);
	if (rc) {
		pr_err("%s: Failed to read flash_maxcurrent rc = %d\n", __func__, rc);
		return rc;
	}

	rc = of_property_read_u32(node, "pwm_period", &flash_led->pwm_period);
	if (rc) {
		pr_err("%s: Failed to read flash_maxcurrent rc = %d\n", __func__, rc);
		return rc;
	}

	return 0;
}
static int led_pwm_pinctrl_init(struct platform_device *pdev, struct led_pwm_flash_data *flash_led)
{
	int rc = 0;
	struct pinctrl_state *gpio_state_default = NULL;

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
	return 0;
error:
	led_pwm_flash_remove(pdev);
	return -EINVAL;
}
static int led_pwm_flash_probe(struct platform_device *pdev)
{
	int rc = 0;
	struct led_pwm_flash_data *flash_led = NULL;
	struct device_node *node = pdev->dev.of_node;
	struct device_node *temp = NULL;

	flash_led = devm_kzalloc(&pdev->dev, sizeof(struct led_pwm_flash_data),
						GFP_KERNEL);
	if (flash_led == NULL) {
		pr_err("%s: Unable to allocate memory\n", __func__);
		return -ENOMEM;
	}
	led_pwm_pinctrl_init(pdev, flash_led);

	rc = led_pwm_flash_parse_dt(pdev, flash_led);
	if (rc) {
		pr_err("%s:parse dt failed!\n", __func__);
		goto error;
	}
	platform_set_drvdata(pdev, flash_led);

	for_each_available_child_of_node(node, temp) {
		rc = led_pwm_flash_register_device(pdev, temp, flash_led);
		if (rc) {
			pr_err("%s: Failed to register led device, rc = %d\n",
				__func__, rc);
			goto error;
		}
	}

	leds_hw_pwm = devm_pwm_get(&pdev->dev, NULL);
	if (IS_ERR(leds_hw_pwm)) {
		pr_err("%s: flash_pwm_probe failed\n", __func__);
		return PTR_ERR(leds_hw_pwm);
	}
	pr_info("%s: probe success\n", __func__);
	return 0;
error:
	led_pwm_flash_remove(pdev);
	return -EINVAL;
}

static const struct of_device_id gpio_of_match[] = {
	{ .compatible = LED_PWM_FLASH_DRIVER_NAME, },
	{},
};

static struct platform_driver led_pwm_flash_driver = {
	.probe = led_pwm_flash_probe,
	.remove = led_pwm_flash_remove,
	.driver = {
		.name = "LED_PWM_FLASH",
		.owner = THIS_MODULE,
		.of_match_table = gpio_of_match,
	},
};

static int __init led_pwm_flash_init(void)
{
	if (platform_driver_register(&led_pwm_flash_driver)) {
		pr_err("%s:register err\n", __func__);
		return -1;
	}
	return 0;
}

static void __exit led_pwm_flash_exit(void)
{
	return platform_driver_unregister(&led_pwm_flash_driver);
}

late_initcall(led_pwm_flash_init);
module_exit(led_pwm_flash_exit);

MODULE_DESCRIPTION("huawei PWM FLASH LEDs driver");
MODULE_LICENSE("GPL v2");
MODULE_ALIAS("leds:leds-hw-pwm-flash");
