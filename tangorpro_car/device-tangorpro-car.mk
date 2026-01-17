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

include device/google/tangorpro/device-tangorpro.mk

PHONE_CAR_BOARD_PRODUCT := tangorpro_car

PRODUCT_PRODUCT_PROPERTIES += \
    ro.oem.key1=AAE00GOOG00TANGORPRO

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.adb.secure=0
endif

PRODUCT_PACKAGES += \
    librs_jni

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := $(filter-out ro.surface_flinger.primary_display_orientation=%,$(PRODUCT_DEFAULT_PROPERTY_OVERRIDES))
PRODUCT_DEFAULT_PROPERTY_OVERRIDES := $(filter-out ro.bootanim.set_orientation_4619827677550801152=%,$(PRODUCT_DEFAULT_PROPERTY_OVERRIDES))
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.primary_display_orientation=ORIENTATION_270

# Filter out the original IDC files from device-tangorpro.mk to avoid duplicate copy errors/overwrites
PRODUCT_COPY_FILES := $(filter-out device/google/tangorpro/NVTCapacitiveTouchScreen.idc:%,$(PRODUCT_COPY_FILES))
PRODUCT_COPY_FILES := $(filter-out device/google/tangorpro/NVTCapacitivePen.idc:%,$(PRODUCT_COPY_FILES))
PRODUCT_COPY_FILES += \
    device/google_car/tangorpro_car/NVTCapacitiveTouchScreen.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/NVTCapacitiveTouchScreen.idc \
    device/google_car/tangorpro_car/NVTCapacitivePen.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/NVTCapacitivePen.idc

PRODUCT_SOONG_NAMESPACES += \
    packages/services/Car/car_product/displaycompat
