BOARD_SEPOLICY_DIRS += device/epam/aosp-xenvm-trout/sepolicy

PRODUCT_COPY_FILES += \
    device/epam/aosp-xenvm-trout/shared/config/init.vendor.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.xenvm_trout.rc \
    device/epam/aosp-xenvm-trout/shared/config/init.recovery.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.xenvm_trout.rc \
    device/epam/aosp-xenvm-trout/shared/config/ueventd.rc:$(TARGET_COPY_OUT_RECOVERY)/root/ueventd.xenvm_trout.rc

LOCAL_AUDIO_PROPERTIES ?= \
    ro.hardware.audio.primary=caremu \
    ro.vendor.caremu.audiohal.out_period_ms=40 \
    ro.vendor.caremu.audiohal.in_period_ms=40 \

LOCAL_VHAL_PRODUCT_PACKAGE ?= android.hardware.automotive.vehicle@2.0-virtualization-service-extended

PRODUCT_PACKAGES += audio.primary.caremu


PRODUCT_COPY_FILES += \
    device/epam/aosp-xenvm-trout/shared/config/fstab.trout_xenvm:$(TARGET_COPY_OUT_RAMDISK)/fstab.trout_xenvm \
    device/epam/aosp-xenvm-trout/shared/config/fstab.trout_xenvm:$(TARGET_COPY_OUT_RAMDISK)/first_stage_ramdisk/fstab.trout_xenvm \
    device/epam/aosp-xenvm-trout/shared/config/fstab.trout_xenvm:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.trout_xenvm \
    device/epam/aosp-xenvm-trout/shared/config/fstab.trout_xenvm:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.trout_xenvm \
    device/epam/aosp-xenvm-trout/shared/config/fstab.trout_xenvm:$(TARGET_COPY_OUT_RAMDISK)/first_stage_ramdisk/fstab.trout_xenvm

PRODUCT_PACKAGE_OVERLAYS += device/epam/aosp-xenvm-trout/overlay
