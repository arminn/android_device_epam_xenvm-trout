# TARGET_PREBUILT_KERNEL - environment variable which could contain path to the prebuilt kernel.
ifneq ($(TARGET_PREBUILT_KERNEL),)
   # Set TARGET_KERNEL_PATH variable which defines which kernel will be used in trout device.
   TARGET_KERNEL_PATH := $(TARGET_PREBUILT_KERNEL)

   # Flag to supress errors in case of usage of the new kernel
   # which is not mentioned in original configs and compatibility matrices.
   PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false
   TARGET_KERNEL_USE := 6.1
endif

LOCAL_OEMLOCK_PRODUCT_PACKAGE := android.hardware.oemlock-service.example

# To override VHAL, declare LOCAL_VHAL_PRODUCT_PACKAGE
# prior to device/google/trout/aosp_trout_arm64.mk include
LOCAL_VHAL_PRODUCT_PACKAGE = android.hardware.automotive.vehicle@2.0-virtualization-service

DEVICE_VIRTWIFI_PORT := eth0

PRODUCT_VENDOR_PROPERTIES += \
    ro.carwatchdog.client_healthcheck.interval=20 \
    ro.carwatchdog.vhal_healthcheck.interval=10 \

ENABLE_EVS_SERVICE := false
ENABLE_EVS_SAMPLE := false

# Enable Thread Network HAL with simulation RCP
PRODUCT_PACKAGES += \
    com.android.hardware.threadnetwork-simulation-rcp

PRODUCT_VENDOR_PROPERTIES += \
	persist.vendor.otsim.local_interface=eth1

$(call inherit-product, device/google/cuttlefish/shared/virgl/device_vendor.mk)
$(call inherit-product, device/google/trout/aosp_trout_arm64.mk)
$(call inherit-product, device/epam/aosp-xenvm-trout/aosp_xenvm_trout_common.mk)

LOCAL_BT_PROPERTIES = \
 vendor.ser.bt-uart=/dev/hvc5 \

PRODUCT_NAME := aosp_xenvm_trout_arm64
PRODUCT_DEVICE := xenvm_trout_arm64
PRODUCT_MODEL := xenvm arm64 trout