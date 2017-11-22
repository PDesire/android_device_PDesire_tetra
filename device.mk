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


# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/PDesire/tetra/overlay

LOCAL_PATH := device/PDesire/tetra

$(call inherit-product, vendor/PDesire/tetra/tetra-vendor.mk)
        
PRODUCT_COPY_FILES +=  device/google/clockwork/bootanimations/square_320/bootanimation.zip:system/media/bootanimation.zip

# BT address
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bt.bdaddr_path=/data/etc/bluetooth_bdaddr

# Wi-Fi interface name
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

# Extra packages
PRODUCT_PACKAGES += \
        nullwebview \
        setup_fs 

# Ramdisk packages
PRODUCT_PACKAGES += \
        fstab.tetra \
        fstab.swap.tetra \
        init.tetra.rc \
        init.common.rc \
        init.tetra.usb.rc \
        init.tetra.debug.rc \
        init.common.debug.rc \
        init.common.usb.rc \
        init.debug.sonyextras.rc \
        init.recovery.tetra.rc \
        ueventd.tetra.rc \
        healthd \
        tad_static \
        wait4tad_static 

PRODUCT_PROPERTY_OVERRIDES += \
    PRODUCT_NAME=tetra 

# Desire Wear Version
PRODUCT_PROPERTY_OVERRIDES += \
    desirewear.version=1.0

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.adb.notify=0 \
    bluetooth.force_pm_timer=2000 \
    persist.sys.media.use-awesome=true \
    log.tag.AmbientService=DEBUG \
    ro.adb.secure=1

PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

$(call inherit-product, device/PDesire/tetra/build/clockwork_tetra.mk)
