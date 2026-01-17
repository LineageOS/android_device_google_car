#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common stuff
$(call inherit-product, vendor/lineage/config/common_car.mk)

# Inherit device configuration
DEVICE_CODENAME := tangorpro
DEVICE_PATH := device/google/tangorpro
VENDOR_PATH := vendor/google/tangorpro
$(call inherit-product, device/google_car/tangorpro_car/aosp_$(DEVICE_CODENAME)_car.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel Tablet
PRODUCT_NAME := lineage_$(DEVICE_CODENAME)_car

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 2560

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="tangorpro-user 16 BP4A.260105.004.E1 14587043 release-keys" \
    BuildFingerprint=google/tangorpro/tangorpro:16/BP4A.260105.004.E1/14587043:user/release-keys \
    DeviceProduct=tangorpro

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
