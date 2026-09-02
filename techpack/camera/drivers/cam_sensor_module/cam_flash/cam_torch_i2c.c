/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2022. All rights reserved.
 *
 * Description: i2c flash light operations
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
#include <dt-bindings/msm/msm-camera.h>
#include "cam_torch_i2c.h"
#include "cam_flash_dev.h"
#include "cam_flash_soc.h"
#include "cam_flash_core.h"
#include "cam_common_util.h"
#include "cam_res_mgr_api.h"
#include "cam_flash_test.h"
#include "camera_i2c_flash_dev.h"

enum {
	I2C_FLASH_OFF_VAL = 0,
	I2C_FLASH_ON_VAL = 1,
};

static struct mutex i2c_flash_test_lock;

static int cam_flash_fill_power_setting(struct cam_flash_ctrl *fctrl,
	struct i2c_flash_info *flash_i2c_info)
{
	int rc = 0;

	CAM_INFO(CAM_FLASH, "i2c flash dev name:%s, sid:0x%x\n",
		flash_i2c_info->name, flash_i2c_info->i2c_info->sid);

	fctrl->power_info.power_setting_size =
		flash_i2c_info->power_up_sequence_size;

	fctrl->power_info.power_setting =
		flash_i2c_info->power_up_sequence;

	fctrl->power_info.power_down_setting_size =
		flash_i2c_info->power_down_sequence_size;

	fctrl->power_info.power_down_setting =
		flash_i2c_info->power_down_sequence;

	fctrl->io_master_info.cci_client->cci_i2c_master =
		flash_i2c_info->i2c_info->cci_i2c_master;

	fctrl->io_master_info.cci_client->i2c_freq_mode =
		flash_i2c_info->i2c_info->i2c_freq_mode;

	fctrl->io_master_info.cci_client->sid =
		(flash_i2c_info->i2c_info->sid >> 1);

	rc = msm_camera_fill_vreg_params(&fctrl->soc_info,
		fctrl->power_info.power_setting,
		fctrl->power_info.power_setting_size);
	if (rc != 0) {
		CAM_ERR(CAM_FLASH,
			"failed to fill vreg params for power up, rc:%d", rc);
		return rc;
	}

	rc = msm_camera_fill_vreg_params(&fctrl->soc_info,
		fctrl->power_info.power_down_setting,
		fctrl->power_info.power_down_setting_size);
	if (rc != 0)
		CAM_ERR(CAM_FLASH,
			"failed to fill vreg params for power down, rc:%d", rc);

	return rc;
}

static int cam_flash_i2c_power_operations(struct cam_flash_ctrl *fctrl,
	bool regulator_enable)
{
	int rc = 0;
	struct cam_hw_soc_info *soc_info = &fctrl->soc_info;
	struct cam_sensor_power_ctrl_t *power_info = &fctrl->power_info;

	if (!power_info || !soc_info) {
		CAM_ERR(CAM_FLASH, "Power Info is NULL");
		return -EINVAL;
	}
	power_info->dev = soc_info->dev;

	if (regulator_enable && (fctrl->is_regulator_enabled == false)) {
		if ((power_info->power_setting == NULL) &&
			(power_info->power_down_setting == NULL)) {
			CAM_INFO(CAM_FLASH, "Using default power settings");
			return rc;
		}

		rc = cam_sensor_core_power_up(power_info, soc_info);
		if (rc) {
			CAM_ERR(CAM_FLASH, "power up the core is failed:%d", rc);
			goto free_pwr_settings;
		}

		rc = camera_io_init(&(fctrl->io_master_info));
		if (rc) {
			CAM_ERR(CAM_FLASH, "cci_init failed rc:%d", rc);
			cam_sensor_util_power_down(power_info, soc_info);
			goto free_pwr_settings;
		}
		fctrl->is_regulator_enabled = true;
	} else if ((!regulator_enable) &&
		(fctrl->is_regulator_enabled == true)) {
		rc = cam_sensor_util_power_down(power_info, soc_info);
		if (rc) {
			CAM_ERR(CAM_FLASH, "power down the core is failed:%d", rc);
			return rc;
		}
		camera_io_release(&(fctrl->io_master_info));
		fctrl->is_regulator_enabled = false;
		goto free_pwr_settings;
	}
	return rc;

free_pwr_settings:
	power_info->power_setting = NULL;
	power_info->power_down_setting = NULL;
	power_info->power_setting_size = 0;
	power_info->power_down_setting_size = 0;

	return rc;
}

static void cam_flash_i2c_dev_match(struct cam_flash_ctrl *fctrl)
{
	uint32_t chip_id_value = 0;
	int rc = 0;
	int i = 0;

	if (flash_i2c_match != NULL) {
		CAM_INFO(CAM_FLASH, "i2c flash dev already match");
		return;
	}

	mutex_lock(&i2c_flash_test_lock);

	for (i = 0; flash_i2c_list[i] != NULL; i++) {
		int16_t retry_times = flash_i2c_list[i]->read_id_retry_times;

		rc = cam_flash_fill_power_setting(fctrl, flash_i2c_list[i]);
		if (rc != 0) {
			CAM_ERR(CAM_FLASH, "failed to fill power setting, rc:%d", rc);
			continue;
		}

		rc = cam_flash_i2c_power_operations(fctrl, true);
		if (rc != 0) {
			CAM_ERR(CAM_FLASH, "power up failed, rc:%d", rc);
			continue;
		}

		do {
			rc = camera_io_dev_read(&fctrl->io_master_info,
				flash_i2c_list[i]->chip_id_addr, &chip_id_value,
				flash_i2c_list[i]->addr_type, flash_i2c_list[i]->data_type);
			if (rc != 0) {
				CAM_ERR(CAM_FLASH, "cci_i2c read failed, rc:%d", rc);
			} else if (chip_id_value == flash_i2c_list[i]->chip_id_value) {
				flash_i2c_match = flash_i2c_list[i];
				break;
			}
			retry_times--;
			msleep(10);
		} while (flash_i2c_match == NULL && retry_times > 0);

		if (cam_flash_i2c_power_operations(fctrl, false) < 0)
			CAM_ERR(CAM_FLASH, "power up failed");

		if (flash_i2c_match != NULL) {
			CAM_INFO(CAM_FLASH, "i2c flash dev matched");
			break;
		} else {
			CAM_ERR(CAM_FLASH, "i2c flash dev not matched, match times:%d", flash_i2c_list[i]->read_id_retry_times);
		}
	}

	mutex_unlock(&i2c_flash_test_lock);
}

static int cam_torch_write_on_setting(struct cam_flash_ctrl *fctrl)
{
	int rc = 0;
	struct cam_sensor_i2c_reg_setting i2c_settings;

	i2c_settings.addr_type = flash_i2c_match->addr_type;
	i2c_settings.data_type = flash_i2c_match->data_type;
	i2c_settings.delay = 1;
	i2c_settings.read_buff = NULL;
	i2c_settings.read_buff_len = 0;
	i2c_settings.size = flash_i2c_match->flash_init_setting_size;
	i2c_settings.reg_setting = flash_i2c_match->flash_init_setting;

	rc = camera_io_dev_write(&fctrl->io_master_info, &i2c_settings);
	if (rc != 0) {
		CAM_ERR(CAM_FLASH, "cci_i2c write init setting failed, rc:%d", rc);
		return rc;
	}

	i2c_settings.size = flash_i2c_match->flash_low_setting_size;
	i2c_settings.reg_setting = flash_i2c_match->flash_low_setting;

	rc = camera_io_dev_write(&fctrl->io_master_info, &i2c_settings);
	if (rc != 0)
		CAM_ERR(CAM_FLASH, "cci_i2c write low setting failed, rc:%d", rc);

	return rc;
}

static int cam_torch_write_off_setting(struct cam_flash_ctrl *fctrl)
{
	int rc = 0;
	struct cam_sensor_i2c_reg_setting i2c_settings;

	i2c_settings.addr_type = flash_i2c_match->addr_type;
	i2c_settings.data_type = flash_i2c_match->data_type;
	i2c_settings.delay = 1;
	i2c_settings.read_buff = NULL;
	i2c_settings.read_buff_len = 0;
	i2c_settings.size = flash_i2c_match->flash_off_setting_size;
	i2c_settings.reg_setting = flash_i2c_match->flash_off_setting;

	rc = camera_io_dev_write(&fctrl->io_master_info, &i2c_settings);
	if (rc != 0)
		CAM_ERR(CAM_FLASH, "cci_i2c write off setting failed, rc:%d", rc);

	return rc;
}

static int cam_torch_i2c_set_brightness(
	struct cam_flash_ctrl *fctrl, enum led_brightness value)
{
	int rc = 0;

	if (flash_i2c_match == NULL) {
		CAM_ERR(CAM_FLASH, "no i2c flash dev");
		return -EINVAL;
	}
	CAM_INFO(CAM_FLASH, "i2c flash dev name:%s", flash_i2c_match->name);
	CAM_INFO(CAM_FLASH, "brightness value:%d", value);

	if (value == I2C_FLASH_ON_VAL &&
		flash_i2c_match->i2c_flash_status == TORCH_OFF) {
		rc = cam_flash_fill_power_setting(fctrl, flash_i2c_match);
		if (rc != 0) {
			CAM_ERR(CAM_FLASH, "failed to fill power setting, rc:%d", rc);
			return rc;
		}

		rc = cam_flash_i2c_power_operations(fctrl, true);
		if (rc != 0) {
			CAM_ERR(CAM_FLASH, "power up failed, rc:%d", rc);
			return rc;
		}

		rc = cam_torch_write_on_setting(fctrl);
		if (rc != 0) {
			CAM_ERR(CAM_FLASH, "cci_i2c write torch on setting failed");
			rc = cam_flash_i2c_power_operations(fctrl, false);
			if (rc != 0)
				CAM_ERR(CAM_FLASH, "power down failed, rc =%d", rc);
			return rc;
		}
		flash_i2c_match->i2c_flash_status = TORCH_ON;
		CAM_INFO(CAM_FLASH, "torch on");
	} else if (value == I2C_FLASH_OFF_VAL &&
		flash_i2c_match->i2c_flash_status == TORCH_ON) {
		rc = cam_torch_write_off_setting(fctrl);
		if (rc != 0)
			CAM_ERR(CAM_FLASH, "cci_i2c write torch off setting failed");
		rc = cam_flash_i2c_power_operations(fctrl, false);
		if (rc != 0)
			CAM_ERR(CAM_FLASH, "power down failed, rc:%d", rc);
		flash_i2c_match->i2c_flash_status = TORCH_OFF;
		CAM_INFO(CAM_FLASH, "torch off");
	} else {
		flash_i2c_match->i2c_flash_status = TORCH_OFF;
		CAM_INFO(CAM_FLASH, "invalid operation");
	}

	return rc;
}

static void set_cam_i2c_torch_switch(struct device *dev, int value)
{
	int brightness;
	int rc = 0;
	struct platform_device *pdev = to_platform_device(dev);
	struct cam_flash_ctrl *fctrl = platform_get_drvdata(pdev);

	if (fctrl == NULL) {
		CAM_ERR(CAM_FLASH, "fctrl is null");
		return;
	}
	mutex_lock(&i2c_flash_test_lock);
	brightness = (value == LED_ON) ? I2C_FLASH_ON_VAL : I2C_FLASH_OFF_VAL;
	rc = cam_torch_i2c_set_brightness(fctrl, brightness);
	mutex_unlock(&i2c_flash_test_lock);
	if (rc != 0)
		CAM_ERR(CAM_FLASH,
			"cam mmi torch set brightness failed, value:%d", value);
}

static void back_cam_i2c_torch_turn_on(struct device *dev)
{
	set_cam_i2c_torch_switch(dev, LED_ON);
}

static void back_cam_i2c_torch_turn_off(struct device *dev)
{
	set_cam_i2c_torch_switch(dev, LED_OFF);
}

int register_i2c_flashlight_data(struct device *dev)
{
	int rc = 0;
	struct platform_device *pdev = NULL;
	struct cam_flash_ctrl *fctrl = NULL;
	struct cam_flash_private_soc *soc_private = NULL;
	struct flashlight_test_operations flashlight_back_ops = {
		.dev = dev,
		.cam_torch_turn_on = back_cam_i2c_torch_turn_on,
		.cam_torch_turn_off = back_cam_i2c_torch_turn_off,
	};
	const char *flash_type = NULL;

	if (dev == NULL) {
		CAM_ERR(CAM_FLASH, "dev is null");
		return -EINVAL;
	}

	pdev = to_platform_device(dev);
	fctrl = platform_get_drvdata(pdev);
	if (fctrl == NULL) {
		CAM_ERR(CAM_FLASH, "fctrl is null");
		return -EINVAL;
	}
	soc_private = fctrl->soc_info.soc_private;
	if (soc_private == NULL) {
		CAM_ERR(CAM_FLASH, "soc_private is null");
		return -EINVAL;
	}
	if (of_find_property(pdev->dev.of_node, "qcom,flash-type", NULL)) {
		rc = of_property_read_string(pdev->dev.of_node, "qcom,flash-type",
			&flash_type);
		if (rc) {
			CAM_ERR(CAM_FLASH, "of_node NULL");
			return -EINVAL;
		}
		if (!strcmp("gpio", flash_type)) {
			CAM_ERR(CAM_FLASH, "of_node qcom,flash-type is gpio");
			return -EINVAL;
		}
	}
	if (soc_private->flash_type == CAM_FLASH_TYPE_I2C) {
		CAM_ERR(CAM_FLASH, "flash_type is I2C_CTRL_TYPE");
		cam_flash_i2c_dev_match(fctrl);
		if (flash_i2c_match == NULL) {
			CAM_ERR(CAM_FLASH, "i2c flash dev not match");
			return -EINVAL;
		}
		rc = cam_flashlight_classdev_register(&flashlight_back_ops,
			FLASH_LIGHT_BACK, I2C_CTRL_TYPE);
		if (rc != 0) {
			CAM_ERR(CAM_FLASH, "i2c flash register classdev failed");
			return rc;
		}

		mutex_init(&i2c_flash_test_lock);
	}

	return rc;
}