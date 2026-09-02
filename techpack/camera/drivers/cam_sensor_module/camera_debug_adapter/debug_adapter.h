#ifndef _HISI_DEBUG_ADAPTER_H_
#define _HISI_DEBUG_ADAPTER_H_
#include <chipset_common/camera/cam_debug/cam_debug_common.h>
#include <chipset_common/camera/cam_debug/cam_debug_log.h>
#include "cam_sensor_dev.h"

struct camera_module_adapter_t {
	int slot_id;
	int vcm_id;
	int ois_id;
	int eeprom_id;
	int flash_id;
	struct cam_sensor_ctrl_t *s_ctrl;
	struct cam_actuator_ctrl_t *a_ctrl;
	struct cam_ois_ctrl_t *o_ctrl;
};

void register_sensor_node(struct camera_module_adapter_t *dev);
int register_vcm_node(int vcm_id, struct cam_actuator_ctrl_t *a_ctrl);
int register_ois_node(int ois_id, struct cam_ois_ctrl_t *o_ctrl);
struct cam_sensor_ctrl_t* get_sensor_ctrl(int slot_id);
struct cam_actuator_ctrl_t* get_vcm_ctrl(int slot_id);
struct cam_ois_ctrl_t* get_ois_ctrl(int slot_id);
int i2c_read(struct debug_msg *recv_data, struct debug_msg *send_data,
	struct camera_io_master *io_master_info);
int i2c_write(struct debug_msg *recv_data,
	struct camera_io_master *io_master_info);
int __init debug_adapter_init(void);
void __exit debug_adapter_exit(void);
#endif
