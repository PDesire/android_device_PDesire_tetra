#
# Copyright (C) 2017 The Android Open Source Project
# Copyright (C) 2017 Tristan Marsell
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/PDesire/tetra

USE_CAMERA_STUB := true

TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := bcm_java
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT:= cortex-a7
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_CPU_SMP := true


TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp  
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

TARGET_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DBINDER_COMPAT

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := tetra
TARGET_NO_KERNEL := false

# Display
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
TARGET_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS -DEGL_NEEDS_FNW -DJAVA_HWC

# libwvm.so
TARGET_GLOBAL_CFLAGS += -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/PDesire/tetra/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/PDesire/tetra/bluetooth/vnd_generic.txt

# Wi-Fi definitions for Broadcom solution
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WLAN_DEVICE_REV       := bcm4330_1
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_BAND                   := 802_11_ABG

# Kernel
BUILD_KERNEL := true
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive enforcing=0
BOARD_KERNEL_BASE := 0x85000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_SOURCE := kernel/tetra
TARGET_KERNEL_CONFIG := tetra_defconfig
BOARD_KERNEL_IMAGE_NAME := zImage-dtb

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_CANT_BUILD_RECOVERY_FROM_BOOT_PATCH := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 23068672
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 23068672
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2873867264
BOARD_CACHEIMAGE_PARTITION_SIZE := 37748760
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Low Memory Device Opt
WITH_DEXPREOPT := false

# GPS
TARGET_SPECIFIC_HEADER_PATH := device/PDesire/tetra/include

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging

# jemalloc causes a lot of random crash on free()
MALLOC_SVELTE := true

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

BOARD_SEPOLICY_DIRS += build/target/board/generic/sepolicy
BOARD_SEPOLICY_DIRS += device/PDesire/tetra/sepolicy
BOARD_SEPOLICY_DIRS += device/google/clockwork/sepolicy

# Resolution
DEVICE_RESOLUTION := 320x320
TARGET_SCREEN_HEIGHT := 320
TARGET_SCREEN_WIDTH := 320
