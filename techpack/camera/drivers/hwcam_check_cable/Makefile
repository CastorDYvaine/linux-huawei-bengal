#
# Makefile
#
# Copyright (c) 2021-2021 Huawei Technologies Co., Ltd.
#
# camera btb check makefile
#
# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#

ccflags-y += -I$(srctree)/techpack/camera/drivers/hwcam_hiview
ccflags-y += -I$(srctree)/techpack/camera/drivers/cam_sensor_module/cam_sensor
ccflags-y += -I$(srctree)/techpack/camera/drivers/cam_sensor_module/cam_eeprom
ccflags-y += -I$(srctree)/techpack/camera/drivers/cam_sensor_module/cam_actuator
ccflags-y += -I$(srctree)/techpack/camera/drivers/cam_sensor_module/cam_ois
ccflags-y += -I$(srctree)/techpack/camera/drivers/cam_sensor_module/cam_cci
ccflags-y += -I$(srctree)/techpack/camera/drivers/cam_sensor_module/cam_sensor_utils
ccflags-y += -I$(srctree)/techpack/camera/drivers/cam_utils
ccflags-y += -I$(srctree)/techpack/camera/drivers/cam_req_mgr
ccflags-y += -I$(srctree)/techpack/camera/drivers/cam_smmu
ccflags-y += -I$(srctree)/techpack/camera/drivers/cam_sensor_module/cam_sensor_io
ccflags-y += -I$(srctree)/techpack/camera/drivers/cam_cpas/include
ccflags-y += -I$(srctree)/techpack/camera/drivers/cam_core
ccflags-y += -I$(srctree)/../../vendor/huawei/chipset_common/plugins/kernel/include/camera

obj-$(CONFIG_SPECTRA_CAMERA) += cam_check_cable.o
