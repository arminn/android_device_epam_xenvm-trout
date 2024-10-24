
TARGET_USERDATAIMAGE_PARTITION_SIZE := 7516192768 # 7 GB

-include device/google/trout/trout_arm64/BoardConfig.mk

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648 # 2 GB

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += device/epam/aosp-xenvm-trout/sepolicy/private

BOARD_BOOTCONFIG := androidboot.fstab_name=fstab
BOARD_BOOTCONFIG += androidboot.fstab_suffix=trout_xenvm
BOARD_BOOTCONFIG += androidboot.vendor.apex.com.android.hardware.keymint=com.android.hardware.keymint.rust_nonsecure
BOARD_BOOTCONFIG += androidboot.vendor.apex.com.android.hardware.gatekeeper=com.android.hardware.gatekeeper.nonsecure
BOARD_BOOTCONFIG += androidboot.vendor.vehiclehal.server.cid=2
BOARD_BOOTCONFIG += androidboot.vendor.vehiclehal.server.port=9210
BOARD_BOOTCONFIG += androidboot.vendor.vehiclehal.server.psf=/data/data/power.file
BOARD_BOOTCONFIG += androidboot.vendor.vehiclehal.server.pss=/data/data/power.socket
BOARD_BOOTCONFIG += androidboot.selinux=permissive
BOARD_BOOTCONFIG += androidboot.android_dt_dir=/proc/device-tree/firmware#1/android/
BOARD_BOOTCONFIG += kernel.vmw_vsock_virtio_transport_common.virtio_transport_max_vsock_pkt_buf_size=16384
BOARD_BOOTCONFIG += androidboot.load_modules_parallel=true
BOARD_BOOTCONFIG += androidboot.enable_bootanimation=0
BOARD_BOOTCONFIG += androidboot.lcd_density=160
BOARD_BOOTCONFIG += androidboot.hardware.hwcomposer=ranchu
BOARD_BOOTCONFIG += androidboot.hardware.hwcomposer.mode=client
BOARD_BOOTCONFIG += androidboot.hardware.hwcomposer.display_finder_mode=drm
BOARD_BOOTCONFIG += androidboot.hardware.gralloc=minigbm
BOARD_BOOTCONFIG += androidboot.hardware.egl=mesa androidboot.boot_devices=33000000.pcie
BOARD_BOOTCONFIG += androidboot.openthread_node_id=1

BOARD_VENDOR_SEPOLICY_DIRS += device/google/cuttlefish/shared/virgl/sepolicy

# Use virgl and mesa3d upstream
BOARD_MESA3D_USES_MESON_BUILD := true
BOARD_MESA3D_GALLIUM_DRIVERS := virgl
