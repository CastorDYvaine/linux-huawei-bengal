// SPDX-License-Identifier: GPL-2.0-only
/*
 * wl2866d-regulator.c
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

#include <linux/regulator/wl2866d-regulator.h>
#include <linux/i2c.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/delay.h>
#include <linux/of_device.h>
#include <linux/regulator/driver.h>
#include <linux/regulator/of_regulator.h>

#define POWER_ON 1
#define POWER_OFF 0
#define AW_I2C_RETRIES 2
#define AW_I2C_RETRY_DELAY 2
#define W2866D_CHIP_REG_NUM 0x0F
#define DVDD_BASEVOLTAGE 600000
#define DVDD_VOLTAGERATIO 6000
#define AVDD_BASEVOLTAGE 1200000
#define AVDD_VOLTAGERATIO 12500

struct wl2866d_regulator {
	struct device		*dev;
	struct regulator_desc	rdesc;
	struct regulator_dev	*rdev;
	struct device_node	*of_node;
};

struct wl2866d_chip *g_chip;

static const struct  wl2866d_map  wl2866d_on_config[] = {
	{ 0x03, 0x4B }, /* default dvdd1:1.05, {0x03, 0x64} 1.2 */
	{ 0x04, 0x4B }, /* default dvdd2:1.05 */
	{ 0x05, 0x80 }, /* default avdd1:2.8 */
	{ 0x06, 0x80 }, /* default avdd2:2.8 */
	{ 0x0E, 0x0F }, /* enable all out dvdd/avdd */
	{ 0x0E, 0x00 },
};

static const char ldo_name[4][13] = {
	"camera_dvdd1",
	"camera_dvdd2",
	"camera_avdd1",
	"camera_avdd2"
};

static int wl2866d_i2c_write(struct wl2866d_chip *chip,
	unsigned char reg_addr, unsigned char reg_data)
{
	int ret = -1;
	unsigned char cnt = 0;

	while (cnt < AW_I2C_RETRIES) {
		ret = i2c_smbus_write_byte_data(chip->client,
			reg_addr, reg_data);
		if (ret < 0)
			pr_err("%s: i2c_write error=%d\n", __func__, ret);
		else
			break;
		cnt++;
		msleep(AW_I2C_RETRY_DELAY);
	}

	return ret;
}

static int wl2866d_i2c_read(struct wl2866d_chip *chip,
	unsigned char reg_addr, unsigned char *reg_data)
{
	int ret = -1;
	unsigned char cnt = 0;

	while (cnt < AW_I2C_RETRIES) {
		ret = i2c_smbus_read_byte_data(chip->client, reg_addr);
		if (ret < 0) {
			pr_err("%s: i2c_read error=%d\n", __func__, ret);
		} else {
			*reg_data = ret;
			break;
		}
		cnt++;
		msleep(AW_I2C_RETRY_DELAY);
	}

	return ret;
}


static int wl2866d_get_power_type(struct regulator_dev *rdev)
{
	int power_type = 0;

	for (power_type = OUT_DVDD1; power_type <= OUT_AVDD2; power_type++) {
		if (!strcmp(ldo_name[power_type], rdev->desc->name))
			return power_type;
	}

	return -EINVAL;
}

static int wl2866d_camera_power_control(struct regulator_dev *rdev,
	int is_power_on)
{
	int ret = 0;
	int power_type = 0;
	unsigned char reg_val = 0;

	power_type = wl2866d_get_power_type(rdev);
	if (power_type < 0) {
		pr_err("can't find power_type\n");
		return power_type;
	}

	ret = wl2866d_i2c_read(g_chip,
		wl2866d_on_config[VOL_ENABLE].reg, &reg_val);
	if (ret < 0) {
		pr_err("wl2866d read enable failed\n");
		return ret;
	}

	if (is_power_on)
		reg_val |= 1 << power_type;
	else
		reg_val &= ~(1 << power_type);

	ret = wl2866d_i2c_write(g_chip,
		wl2866d_on_config[VOL_ENABLE].reg, reg_val);
	if (ret < 0)
		pr_err("wl2866d set enable failed\n");

	return ret;
}

static int wl2866d_output_is_enabled(struct regulator_dev *rdev)
{
	int ret = 0;
	int power_type = 0;
	unsigned char reg_val = 0;

	power_type = wl2866d_get_power_type(rdev);
	if (power_type < 0) {
		pr_err("can't find power_type\n");
		return power_type;
	}

	ret = wl2866d_i2c_read(g_chip,
		wl2866d_on_config[VOL_ENABLE].reg, &reg_val);
	if (ret < 0) {
		pr_err("wl2866d read enable failed\n");
		return ret;
	}
	ret = reg_val & (1 << power_type);
	pr_debug("%s:result = %d\n", __func__, ret);
	return ret;
}

static int wl2866d_output_enable(struct regulator_dev *rdev)
{
	int ret = 0;

	ret = wl2866d_camera_power_control(rdev, POWER_ON);
	if (ret < 0)
		pr_err("%s: failed\n", __func__);

	pr_debug("%s: success\n", __func__);
	return ret;
}

static int wl2866d_output_disable(struct regulator_dev *rdev)
{
	int ret = 0;

	ret = wl2866d_camera_power_control(rdev, POWER_OFF);
	if (ret < 0)
		pr_err("%s: failed\n", __func__);

	pr_debug("%s: success\n", __func__);
	return ret;
}

static int wl2866d_output_get_voltage(struct regulator_dev *rdev)
{
	int ret = 0;
	int voltage = 0;
	int power_type = 0;
	unsigned char value = 0;

	power_type = wl2866d_get_power_type(rdev);
	if (power_type < 0) {
		pr_err("can't find power_type\n");
		return power_type;
	}

	ret = wl2866d_i2c_read(g_chip,
		wl2866d_on_config[power_type].reg, &value);
	if (ret < 0) {
		pr_err("wl2866d_i2c_write failed\n");
		return ret;
	}
	if (power_type == OUT_DVDD1 || power_type == OUT_DVDD2)
		voltage = (value * DVDD_VOLTAGERATIO) + DVDD_BASEVOLTAGE;
	else
		voltage = (value * AVDD_VOLTAGERATIO) + AVDD_BASEVOLTAGE;

	pr_debug("%s: ldo_type = %s min_uv=%d value=%hhu\n",
		__func__, ldo_name[power_type], voltage, value);
	return voltage;
}

static int wl2866d_output_set_voltage(struct regulator_dev *rdev,
	int min_uv, int max_uv, unsigned int *selector)
{
	int ret = 0;
	unsigned char value = 0;
	int power_type = 0;

	power_type = wl2866d_get_power_type(rdev);
	if (power_type < 0) {
		pr_err("can't find power_type\n");
		return power_type;
	}

	if (min_uv == max_uv) {
		if (power_type == OUT_DVDD1 || power_type == OUT_DVDD2)
			value = (min_uv - DVDD_BASEVOLTAGE) / DVDD_VOLTAGERATIO;
		else
			value = (min_uv - AVDD_BASEVOLTAGE) / AVDD_VOLTAGERATIO;

		ret = wl2866d_i2c_write(g_chip,
			wl2866d_on_config[power_type].reg, value);
		if (ret < 0) {
			pr_err("wl2866d_i2c_write failed\n");
			return ret;
		}
	} else {
		pr_err("min_uv != max_uv\n");
		return -EINVAL;
	}

	pr_debug("%s: name = %s min_uv=%d max_uv=%d value=%hhu\n",
		__func__, rdev->desc->name, min_uv, max_uv, value);
	return ret;
}

static struct regulator_ops wl2866d_regulator_ops = {
	.is_enabled = wl2866d_output_is_enabled,
	.enable = wl2866d_output_enable,
	.disable = wl2866d_output_disable,
	.get_voltage = wl2866d_output_get_voltage,
	.set_voltage = wl2866d_output_set_voltage,
};

static int wl2866d_register_ldo(struct wl2866d_regulator *wl2866d_reg,
	const char *name)
{
	int rc;
	struct regulator_config reg_config = {};
	struct regulator_init_data *init_data;
	struct device *dev = wl2866d_reg->dev;
	struct device_node *reg_node = wl2866d_reg->of_node;

	init_data = of_get_regulator_init_data(dev,
		reg_node, &wl2866d_reg->rdesc);
	if (init_data == NULL) {
		dev_err(dev, "%s: failed to get regulator init_data\n", name);
		return -ENODATA;
	}

	if (!init_data->constraints.name) {
		dev_err(dev, "%s: regulator name missing\n", name);
		return -EINVAL;
	}

	reg_config.dev = dev;
	reg_config.init_data = init_data;
	reg_config.driver_data = wl2866d_reg;
	reg_config.of_node = reg_node;

	wl2866d_reg->rdesc.owner = THIS_MODULE;
	wl2866d_reg->rdesc.type = REGULATOR_VOLTAGE;
	wl2866d_reg->rdesc.ops = &wl2866d_regulator_ops;
	wl2866d_reg->rdesc.name = init_data->constraints.name;
	wl2866d_reg->rdesc.n_voltages = 1;

	wl2866d_reg->rdev = devm_regulator_register(dev,
		&wl2866d_reg->rdesc, &reg_config);
	if (IS_ERR(wl2866d_reg->rdev)) {
		rc = PTR_ERR(wl2866d_reg->rdev);
		dev_err(dev, "%s: failed to register regulator rc=%d\n",
			wl2866d_reg->rdesc.name, rc);
		return rc;
	}

	dev_info(dev, "%s regulator registered\n", name);

	return 0;
}

static int wl2866d_parse_regulator(struct device *dev)
{
	int rc = 0;
	const char *name = "";
	struct device_node *child = NULL;
	struct wl2866d_regulator *wl2866d_reg = NULL;

	/* parse each subnode and register regulator for regulator child */
	for_each_available_child_of_node(dev->of_node, child) {
		wl2866d_reg = devm_kzalloc(dev,
			sizeof(*wl2866d_reg), GFP_KERNEL);
		if (!wl2866d_reg)
			return -ENOMEM;

		wl2866d_reg->of_node = child;
		wl2866d_reg->dev = dev;

		rc = of_property_read_string(child, "regulator-name", &name);
		if (rc)
			continue;

		rc = wl2866d_register_ldo(wl2866d_reg, name);
		if (rc < 0) {
			dev_err(dev, "failed to register regulator %s rc=%d\n",
						name, rc);
			return rc;
		}
	}

	return 0;
}

/* Clear the chip register when the wl2866d driver is loaded */
static int clear_chip_register(struct wl2866d_chip *chip)
{
	int i;
	int ret = 0;

	for (i = 0; i <= W2866D_CHIP_REG_NUM; i++)  {
		ret = wl2866d_i2c_write(chip, i, 0);
		if (ret < 0)
			return ret;
	}
	return ret;
}

static int wl2866d_register_init(struct  wl2866d_chip *chip)
{
	int i;
	int ret = 0;

	ret = clear_chip_register(chip);
	if (ret < 0) {
		dev_err(chip->dev, "wl2866d clear reg failed\n");
		return ret;
	}

	for (i = 0; i < ARRAY_SIZE(wl2866d_on_config); i++) {
		ret = wl2866d_i2c_write(chip,
			wl2866d_on_config[i].reg, wl2866d_on_config[i].value);
		if (ret < 0) {
			dev_err(chip->dev, "wl2866d init voltage failed\n");
			return ret;
		}
	}

	return 0;
}

static int wl2866d_enable_power(struct  wl2866d_chip *chip)
{
	int ret = 0;

	ret = regulator_set_voltage(chip->vin1,
		VIN1_1P35_VOL_MIN, VIN1_1P35_VOL_MAX);
	if (ret) {
		dev_err(chip->dev,
			"Unable to set voltage for vin1:%d\n", ret);
		goto put_vin1;
	}

	ret = regulator_enable(chip->vin1);
	if (ret) {
		dev_err(chip->dev, "Unable to enable vin1:%d\n", ret);
		goto unset_vin1;
	}

unset_vin1:
	ret = regulator_set_voltage(chip->vin1, 0, VIN1_1P35_VOL_MAX);
	if (ret)
		dev_err(chip->dev,
			"Unable to set (0) voltage for vin1:%d\n", ret);

put_vin1:
	return ret;
}

static int wl2866d_vreg_init(struct  wl2866d_chip *chip)
{
	int ret = 0;

	chip->vin1 = devm_regulator_get(chip->dev, "vin1");

	if (IS_ERR(chip->vin1)) {
		ret = PTR_ERR(chip->vin1);
		dev_err(chip->dev, "%s: can't get VIN1,%d\n", __func__, ret);
		goto err_vin1;
	}
	return 0;

err_vin1:
	return ret;
}

static int wl2866d_regulator_probe(struct i2c_client *client,
	const struct i2c_device_id *id)
{
	int ret = 0;
	struct wl2866d_chip *chip = NULL;

	dev_info(&client->dev, "wl2866d regulator probe\n");
	chip = devm_kzalloc(&client->dev,
		sizeof(struct wl2866d_chip), GFP_KERNEL);
	if (!chip) {
		ret = -ENOMEM;
		goto err_mem;
	}

	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
		dev_err(&client->dev, "check_functionality failed\n");
		ret = -EIO;
		goto check_i2c_err;
	}

	chip->client = client;
	chip->dev = &client->dev;

	dev_set_drvdata(chip->dev, chip);
	i2c_set_clientdata(chip->client, chip);

	ret = wl2866d_vreg_init(chip);
	if (ret < 0) {
		dev_err(&client->dev, "vreg init failed\n");
		goto vreg_init_err;
	}

	ret = wl2866d_enable_power(chip);
	if (ret) {
		dev_err(&client->dev, "enable power failed\n");
		ret = -1;
		goto enable_power_err;
	}

	ret = wl2866d_register_init(chip);
	if (ret < 0) {
		dev_err(&client->dev, "wl2866d init fail!\n");
		ret = -ENODEV;
		goto init_err;
	}

	g_chip = chip;

	ret = wl2866d_parse_regulator(&client->dev);
	if (ret < 0) {
		dev_err(&client->dev,
			"failed to parse devicetree rc=%d\n", ret);
		goto parse_regulator_err;
	}

	return 0;

parse_regulator_err:
init_err:
enable_power_err:
	devm_regulator_put(chip->vin1);
vreg_init_err:
	chip = NULL;
err_mem:
check_i2c_err:
	return ret;
}

static int wl2866d_regulator_remove(struct i2c_client *client)
{
	struct wl2866d_chip *chip = i2c_get_clientdata(client);

	devm_kfree(chip->dev, chip);
	chip = NULL;
	return 0;
}

static const struct i2c_device_id wl2866d_regulator_id_table[] = {
	{"wl2866d-regulator", 0},
	{}
};

MODULE_DEVICE_TABLE(i2c, wl2866d_regulator_id_table);

static struct i2c_driver wl2866d_regulator_driver = {
	.driver = {
		.name = "wl2866d-regulator",
	},
	.probe = wl2866d_regulator_probe,
	.remove = wl2866d_regulator_remove,
	.id_table = wl2866d_regulator_id_table,
};

static int __init wl2866d_regulator_i2c_init(void)
{
	return i2c_add_driver(&wl2866d_regulator_driver);
}
module_init(wl2866d_regulator_i2c_init);
static void __exit wl2866d_regulator_i2c_exit(void)
{
	i2c_del_driver(&wl2866d_regulator_driver);
}
module_exit(wl2866d_regulator_i2c_exit);

MODULE_LICENSE("GPL v2");
MODULE_DESCRIPTION("probe wl2866d module driver");
MODULE_AUTHOR("Huawei Technologies Co., Ltd.");
