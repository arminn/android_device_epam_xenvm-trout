# TARGET_PREBUILT_KERNEL - environment variable which could contain path to the prebuilt kernel.
ifneq ($(TARGET_PREBUILT_KERNEL),)
   # Set TARGET_KERNEL_PATH variable which defines which kernel will be used in trout device.
   TARGET_KERNEL_PATH := $(TARGET_PREBUILT_KERNEL)

   TARGET_KERNEL_USE := 6.1
endif

# Configure single touch device
PRODUCT_COPY_FILES += \
    device/epam/aosp-xenvm-trout/conf/Vendor_0627_Product_0003.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Vendor_0627_Product_0003.idc

# Disable UWB HAL
PRODUCT_COPY_FILES += \
    device/generic/car/common/android.hardware.disable.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.uwb.xml \

PRODUCT_COPY_FILES += \
    device/epam/aosp-xenvm-trout/init/xenvm_trout.init.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/xenvm_trout.init.rc \
    device/epam/aosp-xenvm-trout/init/ueventd.xenvm.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc \

LOCAL_OEMLOCK_PRODUCT_PACKAGE := android.hardware.oemlock-service.example


PRODUCT_VENDOR_PROPERTIES += ro.hardware.egl=powervr
PRODUCT_VENDOR_PROPERTIES += ro.hardware.vulkan=powervr


# To override VHAL, declare LOCAL_VHAL_PRODUCT_PACKAGE
# prior to device/google/trout/aosp_trout_arm64.mk include
LOCAL_VHAL_PRODUCT_PACKAGE = android.hardware.automotive.vehicle@2.0-default-service

DEVICE_VIRTWIFI_PORT := eth0

PRODUCT_VENDOR_PROPERTIES += \
    ro.carwatchdog.client_healthcheck.interval=20 \
    ro.carwatchdog.vhal_healthcheck.interval=10 \

ENABLE_EVS_SERVICE := false
ENABLE_EVS_SAMPLE := false

# Enable Thread Network HAL with simulation RCP
PRODUCT_PACKAGES += \
    com.android.hardware.threadnetwork-simulation-rcp

TARGET_RECOVERY_FSTAB := device/epam/aosp-xenvm-trout/shared/config/fstab.trout_xenvm

PRODUCT_VENDOR_PROPERTIES += \
	persist.vendor.otsim.local_interface=eth1

# Testing tool for vhost-vsock
PRODUCT_PACKAGES += \
    lisot modetest

#PRODUCT_PACKAGES += \
#    android.hardware.composer.hwc3-service.img \

# Composer 2.3
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.3-hal \
    android.hardware.graphics.composer@2.3-passthrough \
    android.hardware.graphics.composer@2.3-service \
    hwcomposer.xenvm_trout_arm64 \


PRODUCT_VENDOR_PROPERTIES += vendor.hwc.backend_override=client


# Img deps
PRODUCT_PACKAGES += \
    libdmabufinfo \
    libprotobuf-cpp-lite \
    perfetto_trace_protos \
    libperfetto_client_experimental \
    android.hardware.atrace@1.0.vendor \
    android.hardware.dumpstate@1.0.vendor \
    android.hardware.thermal@2.0.vendor \
    android.hardware.thermal@1.0.vendor \
    libion.vendor \
    libdmabufheap.vendor \
    libdumpstateutil.vendor \
    android.hardware.memtrack-V1-ndk.vendor \
    libdrm \
    libarect \
    perfetto_trace_protos

# Global for IMG DDK

PRODUCT_PACKAGES += \
    android.hardware.graphics.common@1.0-impl \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.renderscript@1.0-impl \
    libion \
    libdrm \
    libLLVM \
    img-deps \



# Graphics allocator/mapper HIDL HALs
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.mapper@2.0-impl-2.1

# Graphics allocator AIDL V1 HAL
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator-V1-ndk.vendor

PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0.vndk-sp \
    android.hardware.graphics.mapper@2.0.vndk-sp \
    android.hardware.graphics.mapper@2.1.vndk-sp \
    android.hardware.graphics.common@1.0.vndk-sp \
    android.hardware.atrace@1.0.vndk-sp \
    libhwbinder.vndk-sp \
    libbase.vndk-sp \
    libcutils.vndk-sp \
    libhardware.vndk-sp \
    libhidlbase.vndk-sp \
    libhidltransport.vndk-sp \
    libutils.vndk-sp \
    libc++.vndk-sp \
    libRS_internal.vndk-sp \
    libRSDriver.vndk-sp \
    libRSCpuRef.vndk-sp \
    libbcinfo.vndk-sp \
    libblas.vndk-sp \
    libft2.vndk-sp \
    libpng.vndk-sp \
    libcompiler_rt.vndk-sp \
    libbacktrace.vndk-sp \
    libunwind.vndk-sp \
    libunwindstack.vndk-sp \
    liblzma.vndk-sp \
    libion.vndk-sp \
    android.hardware.graphics.composer@2.1 \
    android.hardware.graphics.allocator-V2-ndk.vendor \
    libgralloctypes.vendor


# Graphics composer HIDL HAL (service added below)
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1.vendor \
    android.hardware.graphics.composer@2.1-impl

# Dumpstate
PRODUCT_PACKAGES += \
    android.hardware.dumpstate@1.1 \
    android.hardware.dumpstate@1.1.vendor

$(call inherit-product, vendor/imagination/rogue_um/x5h/prebuilds.mk)
$(call inherit-product, device/epam/aosp-xenvm-trout/build/graphics.mk)
$(call inherit-product, device/google/cuttlefish/shared/virgl/device_vendor.mk)
$(call inherit-product, device/google/trout/aosp_trout_arm64.mk)
$(call inherit-product, device/epam/aosp-xenvm-trout/aosp_xenvm_trout_common.mk)

LOCAL_BT_PROPERTIES = \
 vendor.ser.bt-uart=/dev/hvc5 \

PRODUCT_NAME := aosp_xenvm_trout_arm64
PRODUCT_DEVICE := xenvm_trout_arm64
PRODUCT_MODEL := xenvm arm64 trout