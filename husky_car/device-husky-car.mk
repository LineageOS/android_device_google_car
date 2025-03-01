#
# Copyright 2023 The Android Open Source Project
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

PHONE_CAR_BOARD_PRODUCT := husky_car

$(call inherit-product, device/google/shusky/husky_generic.mk)

#include device/google/gs101/uwb/uwb.mk

PRODUCT_PRODUCT_PROPERTIES+= \
    ro.adb.secure=0


PRODUCT_PRODUCT_PROPERTIES += \
    ro.sys.multi_client_ime=com.example.android.multiclientinputmethod/.MultiClientInputMethod \
    persist.debug.multi_client_ime=com.example.android.multiclientinputmethod/.MultiClientInputMethod \
    boot.animation.displays=4630947239236256904,4630946674560563842 \

PRODUCT_PACKAGES += \
    MultiClientInputMethod \
    MultiDisplaySecondaryHomeTestLauncher \
    MultiDisplayTest \

PRODUCT_PACKAGE_OVERLAYS += \
    device/google_car/husky_car/overlay

PRODUCT_PACKAGES += \
    librs_jni
