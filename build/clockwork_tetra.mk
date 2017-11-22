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

# Clockwork build for tetra

# Define the host tools and libs that are parts of the SDK.
-include sdk/build/product_sdk.mk
-include development/build/product_sdk.mk

CLOCKWORK_ENABLE_TELEPHONY := true

$(call inherit-product-if-exists, frameworks/base/data/sounds/AllAudio.mk)
$(call inherit-product-if-exists, frameworks/base/data/fonts/fonts.mk)
$(call inherit-product-if-exists, external/roboto-fonts/fonts.mk)
$(call inherit-product-if-exists, frameworks/base/data/keyboards/keyboards.mk)


PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.adb.secure=0

$(call inherit-product, device/google/clockwork/build/clockwork_google.mk)
$(call inherit-product, device/google/clockwork/build/clockwork_audio.mk)
$(call inherit-product, device/google/clockwork/build/wearable-mdpi-512-dalvik-heap.mk)


