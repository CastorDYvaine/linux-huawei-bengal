#ifndef _OCP81373_I2C_FLASH_
#define _OCP81373_I2C_FLASH_

#include "camera_i2c_flash_common.h"

struct cam_sensor_power_setting ocp81373_power_up_sequence[] = {
	{
		.seq_type = SENSOR_VIO,
		.config_val = 1,
		.delay = 1,
	},
};

struct cam_sensor_power_setting ocp81373_power_down_sequence[] = {
	{
		.seq_type = SENSOR_VIO,
		.config_val = 0,
		.delay = 1,
	},
};

struct cam_sensor_cci_client ocp81373_i2c_info = {
	.cci_i2c_master = MASTER_1,
	.i2c_freq_mode = I2C_FAST_MODE,
	.sid = 0xc6,
};

struct cam_sensor_i2c_reg_array ocp81373_flash_init_setting[] = {
	{ 0x01, 0x00, 0, 0 },
	{ 0x03, 0x54, 0, 0 },
	{ 0x05, 0x1E, 0, 0 },
	{ 0x08, 0x1A, 0, 0 },
};

struct cam_sensor_i2c_reg_array ocp81373_flash_low_setting[] = {
	{ 0x05, 0x1E, 0, 0 },
	{ 0x01, 0x09, 0, 0 },
};

struct cam_sensor_i2c_reg_array ocp81373_flash_off_setting[] = {
	{ 0x01, 0x80, 0, 0 },
};

struct i2c_flash_info ocp81373_i2c_flash = {
	.name = "ocp81373",
	.chip_id_addr = 0x0C,
	.chip_id_value = 0x3A,
	.i2c_info = &ocp81373_i2c_info,
	.addr_type = CAMERA_SENSOR_I2C_TYPE_BYTE,
	.data_type = CAMERA_SENSOR_I2C_TYPE_BYTE,
	.power_up_sequence_size = sizeof(ocp81373_power_up_sequence) / sizeof(struct cam_sensor_power_setting),
	.power_up_sequence = ocp81373_power_up_sequence,
	.power_down_sequence_size = sizeof(ocp81373_power_down_sequence) / sizeof(struct cam_sensor_power_setting),
	.power_down_sequence = ocp81373_power_down_sequence,
	.flash_init_setting_size = sizeof(ocp81373_flash_init_setting) / sizeof(struct cam_sensor_i2c_reg_array),
	.flash_init_setting = ocp81373_flash_init_setting,
	.flash_low_setting_size = sizeof(ocp81373_flash_low_setting) / sizeof(struct cam_sensor_i2c_reg_array),
	.flash_low_setting = ocp81373_flash_low_setting,
	.flash_off_setting_size = sizeof(ocp81373_flash_off_setting) / sizeof(struct cam_sensor_i2c_reg_array),
	.flash_off_setting = ocp81373_flash_off_setting,
	.i2c_flash_status = 0,
	.read_id_retry_times = 2,
};

#endif