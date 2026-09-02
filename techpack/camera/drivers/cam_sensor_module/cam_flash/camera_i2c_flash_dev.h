#ifndef _I2C_FLASH_DEV_H_
#define _I2C_FLASH_DEV_H_

#include "aw3642_i2c_flash.h"
#include "mp3331_i2c_flash.h"
#include "aw36515_i2c_flash.h"
#include "ocp81373_i2c_flash.h"
#define TORCH_ON  1
#define TORCH_OFF 0

struct i2c_flash_info *flash_i2c_match = NULL;

struct i2c_flash_info *flash_i2c_list[] = {
	&aw3642_i2c_flash,
	&mp3331_i2c_flash,
	&aw36515_i2c_flash,
	&ocp81373_i2c_flash,
	NULL,
};

#endif