BOARD_KERNEL_CMDLINE += androidboot.fstab_name=fstab androidboot.fstab_suffix=trout_xenvm

TARGET_USERDATAIMAGE_PARTITION_SIZE := 7516192768 # 7 GB

-include device/google/trout/trout_arm64/BoardConfig.mk

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648 # 2 GB

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += device/epam/aosp-xenvm-trout/sepolicy/private
