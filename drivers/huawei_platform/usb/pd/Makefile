subdir-ccflags-y += -I$(srctree)/drivers/misc/mediatek/typec/tcpc/inc
subdir-ccflags-y += -I$(srctree)/drivers/devkit/audiokit
obj-$(CONFIG_HUAWEI_PD) += hw_pd.o
obj-$(CONFIG_HUAWEI_PD_THIRDPARTY) += hw_pd_thirdparty.o
ifdef CONFIG_SUPPORT_USB_PD30
obj-$(CONFIG_TCPC_RT1715) += rt1715/
else
obj-$(CONFIG_TCPC_RT1711H) += richtek/
endif
ifeq ($(TARGET_PRODUCT),bengal)
ccflags-y += -DQCOM_PLATFORM_6225
endif
