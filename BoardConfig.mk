#
#           (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from the proprietary version
-include vendor/NUBIA/MSM8226/BoardConfigVendor.mk

LOCAL_PATH := device/NUBIA/X9180

PRODUCT_COPY_FILES := $(filter-out frameworks/base/data/keyboards/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	frameworks/base/data/keyboards/Generic.kl:system/usr/keylayout/Generic.kl \
	frameworks/base/data/keyboards/Generic.kcm:system/usr/keychars/Generic.kcm, $(PRODUCT_COPY_FILES))

# RIL
TARGET_RIL_VARIANT := caf

# Assert
TARGET_OTA_ASSERT_DEVICE := X9180,N9180,U9180,x9180,n9180,u9180

BLOCK_BASED_OTA := false

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 25165824
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12738083840

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8226
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_VENDOR := zte-qcom

# Platform
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Kernel
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x37 ehci-hcd.park=3 androidboot.bootdevice=msm_sdcc.1 androidboot.selinux=permissive
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
#TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000
KERNEL_TOOLCHAIN_PREFIX := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
TARGET_KERNEL_SOURCE := kernel/NUBIA/X9180
TARGET_KERNEL_ARCH := arm
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkbootimg.mk
TARGET_KERNEL_CONFIG := msm8926-ne501j_defconfig

BOARD_GLOBAL_CFLAGS += -DCOMPAT_SENSORS_M

# Power
TARGET_POWERHAL_VARIANT := qcom

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true

# FM
#QCOM_FM_ENABLED := true
#AUDIO_FEATURE_ENABLED_FM := true
BOARD_HAVE_QCOM_FM := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
QCOM_BT_USE_SMD_TTY := true

# Enables Adreno RS driver
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Ant or qualcomm-uart ?
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
BOARD_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_USE_COMPAT_GRALLOC_ALIGN := true

# RPC
TARGET_NO_RPC := true

# Use Snapdragon LLVM, if available
TARGET_USE_SDCLANG := true

# CMHW
TARGET_TAP_TO_WAKE_NODE := "/data/tp/easy_wakeup_gesture"
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += \
    hardware/cyanogen/cmhw \
    device/NUBIA/X9180/cmhw

# Encryption
TARGET_HW_DISK_ENCRYPTION := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QC_TIME_SERVICES := true
USE_DEVICE_SPECIFIC_QCOM_PROPRIETARY:= true

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"
TARGET_USES_WCNSS_CTRL := true
TARGET_USES_QCOM_WCNSS_QMI := true
TARGET_PROVIDES_WCNSS_QMI := true

# Recovery
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_QCOM_RTC_FIX := true

# TWRP recovery
ifeq ($(WITH_TWRP),true)
RECOVERY_VARIANT := twrp
RECOVERY_SDCARD_ON_DATA := true
BOARD_SUPPRESS_SECURE_ERASE := true
TW_USE_TOOLBOX := true
TW_TARGET_USES_QCOM_BSP := true
TW_THEME := portrait_hdpi
TW_INCLUDE_CRYPTO := true
TW_IGNORE_MISC_WIPE_DATA := true
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/cryptfs_hw
TW_INCLUDE_NTFS_3G := true
TW_NO_SCREEN_BLANK := true
TW_DEVICE_VERSION := 1

TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
PRODUCT_COPY_FILES += \
	bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata \
	$(LOCAL_PATH)/recovery/twrp.fstab:recovery/root/etc/twrp.fstab
endif

# dex-preoptimization to speed up first boot sequence
#WITH_DEXPREOPT := false

#SKIP_BOOT_JARS_CHECK := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/NUBIA/X9180/sepolicy

