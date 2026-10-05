#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)
MY_DIR := $(LOCAL_PATH)

# lineage-20.0 has no install_symlink module type, so the symlinks are
# declared here as prebuilt modules whose post-install step replaces the
# installed file with the real symlink (installing a symlink directly would
# make the default copy step dereference it).

include $(CLEAR_VARS)
LOCAL_MODULE := firmware_WCNSS_qcom_cfg.ini_symlink
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/firmware/wlan/prima
LOCAL_MODULE_STEM := WCNSS_qcom_cfg.ini
LOCAL_SRC_FILES := Android.mk
LOCAL_POST_INSTALL_CMD := ln -sf /vendor/etc/wifi/WCNSS_qcom_cfg.ini $(LOCAL_INSTALLED_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := firmware_WCNSS_wlan_dictionary.dat_symlink
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/firmware/wlan/prima
LOCAL_MODULE_STEM := WCNSS_wlan_dictionary.dat
LOCAL_SRC_FILES := Android.mk
LOCAL_POST_INSTALL_CMD := ln -sf /mnt/vendor/persist/WCNSS_wlan_dictionary.dat $(LOCAL_INSTALLED_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := system_ext_priv-app_ims_lib_arm64_libimscamera_jni_so
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_SYSTEM_EXT)/priv-app/ims/lib/arm64
LOCAL_MODULE_STEM := libimscamera_jni.so
LOCAL_SRC_FILES := Android.mk
LOCAL_POST_INSTALL_CMD := ln -sf /system_ext/lib64/libimscamera_jni.so $(LOCAL_INSTALLED_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := system_ext_priv-app_ims_lib_arm64_libimsmedia_jni_so
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_SYSTEM_EXT)/priv-app/ims/lib/arm64
LOCAL_MODULE_STEM := libimsmedia_jni.so
LOCAL_SRC_FILES := Android.mk
LOCAL_POST_INSTALL_CMD := ln -sf /system_ext/lib64/libimsmedia_jni.so $(LOCAL_INSTALLED_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := CneApp.libvndfwk_detect_jni.qti_symlink
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/app/CneApp/lib/arm64
LOCAL_MODULE_STEM := libvndfwk_detect_jni.qti.so
LOCAL_SRC_FILES := Android.mk
LOCAL_POST_INSTALL_CMD := ln -sf /vendor/lib64/libvndfwk_detect_jni.qti_vendor.so $(LOCAL_INSTALLED_MODULE)
include $(BUILD_PREBUILT)

# The legacy wifi HIDL service from hardware/lineage/interfaces/wifi/1.0-legacy
# cannot be built as-is on a lineage-20.0 tree whose libbase/fmt pulls <cmath>
# into the translation units before the generated wifi HIDL headers: the NAN
# macro collides with the RttPeerType::NAN/IfaceType::NAN enum members.
# Rebuild the same sources here with a pre-include that neutralises the macro.
LOCAL_PATH := hardware/lineage/interfaces/wifi/1.0-legacy

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.wifi@1.0-service.legacy20
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_PROPRIETARY_MODULE := true
LOCAL_CPPFLAGS := -Wall -Werror -Wextra
ifdef WIFI_AVOID_IFACE_RESET_MAC_CHANGE
LOCAL_CPPFLAGS += -DWIFI_AVOID_IFACE_RESET_MAC_CHANGE
endif
LOCAL_CFLAGS := -Wno-error=implicit-fallthrough -include $(MY_DIR)/wifi_legacy/nan_compat.h
LOCAL_SRC_FILES := \
    service.cpp \
    hidl_struct_util.cpp \
    hidl_sync_util.cpp \
    ringbuffer.cpp \
    wifi.cpp \
    wifi_ap_iface.cpp \
    wifi_chip.cpp \
    wifi_feature_flags.cpp \
    wifi_iface_util.cpp \
    wifi_legacy_hal.cpp \
    wifi_legacy_hal_stubs.cpp \
    wifi_mode_controller.cpp \
    wifi_nan_iface.cpp \
    wifi_p2p_iface.cpp \
    wifi_rtt_controller.cpp \
    wifi_sta_iface.cpp \
    wifi_status_util.cpp
LOCAL_SHARED_LIBRARIES := \
    libbase \
    libcutils \
    libhidlbase \
    liblog \
    libnl \
    libutils \
    libwifi-hal \
    libwifi-system-iface \
    android.hardware.wifi@1.0 \
    android.hardware.wifi@1.1 \
    android.hardware.wifi@1.2 \
    android.hardware.wifi@1.3 \
    android.hardware.wifi@1.4
LOCAL_VINTF_FRAGMENTS := ../../../../../device/vsmart/msm8953-common/wifi_legacy/android.hardware.wifi@1.0-service.legacy20.xml
LOCAL_INIT_RC := ../../../../../device/vsmart/msm8953-common/wifi_legacy/android.hardware.wifi@1.0-service.legacy20.rc
include $(BUILD_EXECUTABLE)
