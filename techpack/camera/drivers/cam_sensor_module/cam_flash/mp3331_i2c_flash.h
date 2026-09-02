#ifndef _MP3331_I2C_FLASH_
#define _MP3331_I2C_FLASH_

#include "camera_i2c_flash_common.h"

struct cam_sensor_power_setting mp3331_power_up_sequence[] = {
	{
		.seq_type = SENSOR_VIO,
		.config_val = 1,
		.delay = 1,
	},
};

struct cam_sensor_power_setting mp3331_power_down_sequence[] = {
	{
		.seq_type = SENSOR_VIO,
		.config_val = 0,
		.delay = 1,
	},
};
//I2C_STANDARD_MODE   I2C_FAST_MODE
struct cam_sensor_cci_client mp3331_i2c_info = {
	.cci_i2c_master = MASTER_1,
	.i2c_freq_mode = I2C_FAST_MODE,
	.sid = 0xce,
};

struct cam_sensor_i2c_reg_array mp3331_flash_init_setting[] = {
	{0x01, 0xA0, 0, 0},
	{0x03, 0x32, 0, 0},
	{0x06, 0x25, 0, 0},
	{0x0a, 0x06, 0, 0},
};

struct cam_sensor_i2c_reg_array mp3331_flash_low_setting[] = {
	{0x0A, 0x03, 0, 0},
	{0x01, 0xB4, 0, 0},
};

struct cam_sensor_i2c_reg_array mp3331_flash_off_setting[] = {
	{0x0A, 0x00, 0, 0},
	{0x01, 0xA0, 0, 0},
};

struct i2c_flash_info mp3331_i2c_flash = {
	.name = "mp3331",
	.chip_id_addr = 0x00,
	.chip_id_value = 0x18,
	.i2c_info = &mp3331_i2c_info,
	.addr_type = CAMERA_SENSOR_I2C_TYPE_BYTE,
	.data_type = CAMERA_SENSOR_I2C_TYPE_BYTE,
	.power_up_sequence_size = sizeof(mp3331_power_up_sequence) / sizeof(struct cam_sensor_power_setting),
	.power_up_sequence = mp3331_power_up_sequence,
	.power_down_sequence_size = sizeof(mp3331_power_down_sequence) / sizeof(struct cam_sensor_power_setting),
	.power_down_sequence = mp3331_power_down_sequence,
	.flash_init_setting_size = sizeof(mp3331_flash_init_setting) / sizeof(struct cam_sensor_i2c_reg_array),
	.flash_init_setting = mp3331_flash_init_setting,
	.flash_low_setting_size = sizeof(mp3331_flash_low_setting) / sizeof(struct cam_sensor_i2c_reg_array),
	.flash_low_setting = mp3331_flash_low_setting,
	.flash_off_setting_size = sizeof(mp3331_flash_off_setting) / sizeof(struct cam_sensor_i2c_reg_array),
	.flash_off_setting = mp3331_flash_off_setting,
	.i2c_flash_status = 0,
	.read_id_retry_times = 1,
};

#endif