#ifndef _CAMERA_I2C_FLASH_COMMON_H_
#define _CAMERA_I2C_FLASH_COMMON_H_

#include <cam_cci_dev.h>
#include "cam_sensor_cmn_header.h"

struct i2c_flash_info {
	char name[10];
	uint16_t power_up_sequence_size;
	struct cam_sensor_power_setting *power_up_sequence;
	uint16_t power_down_sequence_size;
	struct cam_sensor_power_setting *power_down_sequence;
	struct cam_sensor_cci_client *i2c_info;
	enum camera_sensor_i2c_type addr_type;
	enum camera_sensor_i2c_type data_type;
	uint32_t chip_id_addr;
	uint32_t chip_id_value;
	uint32_t flash_init_setting_size;
	struct cam_sensor_i2c_reg_array *flash_init_setting;
	uint32_t flash_low_setting_size;
	struct cam_sensor_i2c_reg_array *flash_low_setting;
	uint32_t flash_off_setting_size;
	struct cam_sensor_i2c_reg_array *flash_off_setting;
	uint16_t i2c_flash_status;
	int16_t read_id_retry_times;
};

#endif