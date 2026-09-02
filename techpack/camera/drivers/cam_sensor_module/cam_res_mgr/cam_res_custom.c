/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2021-2021. All rights reserved.
 * Description: camera custom pinctrl class implementation.
 */

#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/slab.h>
#include <linux/gpio.h>
#include "cam_debug_util.h"
#include "cam_res_mgr_api.h"
#include "cam_res_mgr_private.h"

/* pinctrl states name */
#define CAM_RES_CUSTOM_SLEEP	"cam_res_custom_suspend"
#define CAM_RES_CUSTOM_DEFAULT	"cam_res_custom_default"


static struct cam_res_mgr *cam_res;

static void cam_res_custom_free_res(void)
{
	struct cam_dev_res *dev_res = NULL;
	struct cam_dev_res *dev_temp = NULL;
	struct cam_gpio_res *gpio_res = NULL;
	struct cam_gpio_res *gpio_temp = NULL;
	struct cam_flash_res *flash_res = NULL;
	struct cam_flash_res *flash_temp = NULL;

	if (cam_res == NULL)
		return;

	mutex_lock(&cam_res->gpio_res_lock);
	list_for_each_entry_safe(gpio_res, gpio_temp,
		&cam_res->gpio_res_list, list) {
		list_for_each_entry_safe(dev_res, dev_temp,
			&gpio_res->dev_list, list) {
			list_del_init(&dev_res->list);
			kfree(dev_res);
		}
		list_del_init(&gpio_res->list);
		kfree(gpio_res);
	}
	mutex_unlock(&cam_res->gpio_res_lock);

	mutex_lock(&cam_res->flash_res_lock);
	list_for_each_entry_safe(flash_res, flash_temp,
		&cam_res->flash_res_list, list) {
		list_del_init(&flash_res->list);
		kfree(flash_res);
	}
	mutex_unlock(&cam_res->flash_res_lock);

	mutex_lock(&cam_res->clk_res_lock);
	cam_res->shared_clk_ref_count = 0;
	mutex_unlock(&cam_res->clk_res_lock);
}

int cam_res_custom_shared_pinctrl_init(void)
{
	struct cam_soc_pinctrl_info *pinctrl_info = NULL;

	/*
	 * We allow the cam_res is NULL or shared_gpio_enabled
	 * is false, it means this driver no probed or doesn't
	 * have shared gpio in this device.
	 */
	if (cam_res == NULL || !cam_res->shared_gpio_enabled) {
		CAM_DBG(CAM_RES, "Not support shared gpio.");
		return 0;
	}

	mutex_lock(&cam_res->gpio_res_lock);
	if (cam_res->pstatus != PINCTRL_STATUS_PUT) {
		CAM_DBG(CAM_RES, "The shared pinctrl already been got.");
		mutex_unlock(&cam_res->gpio_res_lock);
		return 0;
	}

	pinctrl_info = &cam_res->dt.pinctrl_info;

	pinctrl_info->pinctrl =
		devm_pinctrl_get(cam_res->dev);
	if (IS_ERR_OR_NULL(pinctrl_info->pinctrl)) {
		CAM_ERR(CAM_RES, "Pinctrl not available");
		cam_res->shared_gpio_enabled = false;
		mutex_unlock(&cam_res->gpio_res_lock);
		return -EINVAL;
	}

	pinctrl_info->gpio_state_active =
		pinctrl_lookup_state(pinctrl_info->pinctrl,
			CAM_RES_CUSTOM_DEFAULT);
	if (IS_ERR_OR_NULL(pinctrl_info->gpio_state_active)) {
		CAM_ERR(CAM_RES,
			"Failed to get the active state pinctrl handle");
		cam_res->shared_gpio_enabled = false;
		mutex_unlock(&cam_res->gpio_res_lock);
		return -EINVAL;
	}

	pinctrl_info->gpio_state_suspend =
		pinctrl_lookup_state(pinctrl_info->pinctrl,
			CAM_RES_CUSTOM_SLEEP);
	if (IS_ERR_OR_NULL(pinctrl_info->gpio_state_suspend)) {
		CAM_ERR(CAM_RES,
			"Failed to get the active state pinctrl handle");
		cam_res->shared_gpio_enabled = false;
		mutex_unlock(&cam_res->gpio_res_lock);
		return -EINVAL;
	}

	cam_res->pstatus = PINCTRL_STATUS_GOT;
	CAM_DBG(CAM_RES, "pinctrl status: %d", cam_res->pstatus);
	mutex_unlock(&cam_res->gpio_res_lock);

	return 0;
}

static bool cam_res_custom_shared_pinctrl_check_hold(void)
{
	int index = 0;
	int dev_num = 0;
	bool hold = false;
	struct list_head *list = NULL;
	struct cam_gpio_res *gpio_res = NULL;
	struct cam_res_mgr_dt *dt = &cam_res->dt;

	for (; index < dt->num_shared_gpio; index++) {
		list_for_each_entry(gpio_res,
			&cam_res->gpio_res_list, list) {
			if (gpio_res->gpio ==
				dt->shared_gpio[index]) {
				list_for_each(list, &gpio_res->dev_list)
					dev_num++;

				if (dev_num >= 2) {
					hold = true;
					break;
				}
			}
		}
	}

	if (cam_res->shared_clk_ref_count > 1)
		hold = true;

	return hold;
}

int cam_res_custom_shared_pinctrl_select_state(bool active)
{
	int rc = 0;
	struct cam_soc_pinctrl_info *pinctrl_info = NULL;

	if (cam_res == NULL || !cam_res->shared_gpio_enabled) {
		CAM_DBG(CAM_RES, "Not support shared gpio.");
		return 0;
	}

	mutex_lock(&cam_res->gpio_res_lock);
	if (cam_res->pstatus == PINCTRL_STATUS_PUT) {
		CAM_DBG(CAM_RES, "The shared pinctrl alerady been put.!");
		mutex_unlock(&cam_res->gpio_res_lock);
		return 0;
	}

	pinctrl_info = &cam_res->dt.pinctrl_info;

	if (active && (cam_res->pstatus != PINCTRL_STATUS_ACTIVE)) {
		rc = pinctrl_select_state(pinctrl_info->pinctrl,
			pinctrl_info->gpio_state_active);
		cam_res->pstatus = PINCTRL_STATUS_ACTIVE;
	} else if (!active &&
		!cam_res_custom_shared_pinctrl_check_hold()) {
		rc = pinctrl_select_state(pinctrl_info->pinctrl,
			pinctrl_info->gpio_state_suspend);
		cam_res->pstatus = PINCTRL_STATUS_SUSPEND;
	}

	CAM_INFO(CAM_RES, "pinctrl state:%d, rc=%d", cam_res->pstatus, rc);
	mutex_unlock(&cam_res->gpio_res_lock);

	return rc;
}

static int cam_res_custom_parse_dt(struct device *dev)
{
	int rc = 0;
	struct device_node *of_node = NULL;
	struct cam_res_mgr_dt *dt = &cam_res->dt;
	int i = 0;

	of_node = dev->of_node;

	dt->num_shared_gpio = of_property_count_u32_elems(of_node,
		"shared-gpios");

	if (dt->num_shared_gpio > MAX_SHARED_GPIO_SIZE ||
		dt->num_shared_gpio <= 0) {
		/*
		 * Not really an error, it means dtsi not configure
		 * the shared gpio.
		 */
		CAM_DBG(CAM_RES, "Invalid GPIO number %d. No shared gpio.",
			dt->num_shared_gpio);
		return -EINVAL;
	}

	rc = of_property_read_u32_array(of_node, "shared-gpios",
		dt->shared_gpio, dt->num_shared_gpio);
	if (rc) {
		CAM_ERR(CAM_RES, "Get shared gpio array failed.");
		return -EINVAL;
	}

	for (i = 0; i < dt->num_shared_gpio; i++)
		CAM_INFO(CAM_RES, "shared-gpios[%d]: %d", i, dt->shared_gpio[i]);

	dt->pinctrl_info.pinctrl = devm_pinctrl_get(dev);
	if (IS_ERR_OR_NULL(dt->pinctrl_info.pinctrl)) {
		CAM_ERR(CAM_RES, "Pinctrl not available");
		return -EINVAL;
	}

	/*
	 * Check the pinctrl state to make sure the gpio
	 * shared enabled.
	 */
	dt->pinctrl_info.gpio_state_active =
		pinctrl_lookup_state(dt->pinctrl_info.pinctrl,
			CAM_RES_CUSTOM_DEFAULT);
	if (IS_ERR_OR_NULL(dt->pinctrl_info.gpio_state_active)) {
		CAM_ERR(CAM_RES,
			"Failed to get the active state pinctrl handle");
		return -EINVAL;
	}

	dt->pinctrl_info.gpio_state_suspend =
		pinctrl_lookup_state(dt->pinctrl_info.pinctrl,
			CAM_RES_CUSTOM_SLEEP);
	if (IS_ERR_OR_NULL(dt->pinctrl_info.gpio_state_suspend)) {
		CAM_ERR(CAM_RES,
			"Failed to get the active state pinctrl handle");
		return -EINVAL;
	}

	devm_pinctrl_put(dt->pinctrl_info.pinctrl);

	return rc;
}

static int cam_res_custom_probe(struct platform_device *pdev)
{
	int rc = 0;

	cam_res = kzalloc(sizeof(*cam_res), GFP_KERNEL);
	if (cam_res == NULL)
		return -ENOMEM;

	cam_res->dev = &pdev->dev;
	mutex_init(&cam_res->flash_res_lock);
	mutex_init(&cam_res->gpio_res_lock);
	mutex_init(&cam_res->clk_res_lock);

	rc = cam_res_custom_parse_dt(&pdev->dev);
	if (rc) {
		CAM_INFO(CAM_RES, "Disable shared gpio support.");
		cam_res->shared_gpio_enabled = false;
	} else {
		CAM_INFO(CAM_RES, "Enable shared gpio support.");
		cam_res->shared_gpio_enabled = true;
	}

	cam_res->shared_clk_ref_count = 0;
	cam_res->pstatus = PINCTRL_STATUS_PUT;

	INIT_LIST_HEAD(&cam_res->gpio_res_list);
	INIT_LIST_HEAD(&cam_res->flash_res_list);

	return 0;
}

static int cam_res_custom_remove(struct platform_device *pdev)
{
	if (cam_res != NULL) {
		cam_res_custom_free_res();
		kfree(cam_res);
		cam_res = NULL;
	}

	return 0;
}

static const struct of_device_id cam_res_custom_dt_match[] = {
	{.compatible = "qcom,cam-res-custom"},
	{}
};
MODULE_DEVICE_TABLE(of, cam_res_custom_dt_match);

static struct platform_driver cam_res_custom_driver = {
	.probe = cam_res_custom_probe,
	.remove = cam_res_custom_remove,
	.driver = {
		.name = "cam_res_custom",
		.owner = THIS_MODULE,
		.of_match_table = cam_res_custom_dt_match,
		.suppress_bind_attrs = true,
	},
};

static int __init cam_res_custom_init(void)
{
	return platform_driver_register(&cam_res_custom_driver);
}

static void __exit cam_res_custom_exit(void)
{
	platform_driver_unregister(&cam_res_custom_driver);
}

module_init(cam_res_custom_init);
module_exit(cam_res_custom_exit);
MODULE_DESCRIPTION("Camera resource manager driver");
MODULE_LICENSE("GPL v2");
