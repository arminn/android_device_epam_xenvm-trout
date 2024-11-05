# TARGET_PREBUILT_KERNEL - environment variable which could contain path to the prebuilt kernel.
ifneq ($(TARGET_PREBUILT_KERNEL),)
   # Set TARGET_KERNEL_PATH variable which defines which kernel will be used in trout device.
   TARGET_KERNEL_PATH := $(TARGET_PREBUILT_KERNEL)

   # Flag to supress errors in case of usage of the new kernel
   # which is not mentioned in original configs and compatibility matrices.
   PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false
   TARGET_KERNEL_USE := 6.1
endif

# BOARD_KERNEL_CMDLINE += \
#    androidboot.qemu=1 \
#    androidboot.selinux=permissive \
#    androidboot.fstab_suffix=trout \
#    androidboot.hardware=cutf_cvm \
#    androidboot.slot_suffix=_a \
#    androidboot.hardware.gralloc=minigbm \
#    androidboot.hardware.hwcomposer=drm_minigbm \
#    androidboot.hardware.egl=mesa \
#    androidboot.logcat=*:V \
#    androidboot.vendor.vehiclehal.server.cid=2 \
#    androidboot.vendor.vehiclehal.server.port=9300 \
#    androidboot.vendor.vehiclehal.server.psf=/data/data/power.file \
#    androidboot.vendor.vehiclehal.server.pss=/data/data/power.socket \
#    androidboot.boot_devices=4010000000.pcie \
#    loglevel=7 \
#    console=ttyAMA0

LOCAL_OEMLOCK_PRODUCT_PACKAGE := android.hardware.oemlock-service.example

# To override VHAL, declare LOCAL_VHAL_PRODUCT_PACKAGE
# prior to device/google/trout/aosp_trout_arm64.mk include
LOCAL_VHAL_PRODUCT_PACKAGE = android.hardware.automotive.vehicle@2.0-virtualization-service

DEVICE_VIRTWIFI_PORT := eth2

PRODUCT_VENDOR_PROPERTIES += \
    ro.carwatchdog.client_healthcheck.interval=20 \
    ro.carwatchdog.vhal_healthcheck.interval=10 \

$(call inherit-product, device/google/cuttlefish/shared/virgl/device_vendor.mk)
$(call inherit-product, device/google/trout/aosp_trout_arm64.mk)

include device/epam/aosp-xenvm-trout/aosp_xenvm_trout_common.mk

LOCAL_BT_PROPERTIES = \
 vendor.ser.bt-uart=/dev/hvc5 \

PRODUCT_NAME := aosp_xenvm_trout_arm64
PRODUCT_DEVICE := xenvm_trout_arm64
PRODUCT_MODEL := xenvm arm64 trout
