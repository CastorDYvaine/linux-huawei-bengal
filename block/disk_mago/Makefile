#
#  Makefile for disk mago info feature.
#
ifeq ($(CONFIG_DISK_MAGO),y)
ccflags-y += -I$(srctree)/drivers/scsi/
ccflags-y += -I$(srctree)/drivers/mmc/
endif
obj-$(CONFIG_DISK_MAGO)	+= disk_mago_info.o disk_mago_latency.o