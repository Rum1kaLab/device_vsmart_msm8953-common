#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

# lineage-20.0 has no install_symlink module type, so the symlinks are
# declared here as plain make modules.

include $(CLEAR_VARS)
LOCAL_MODULE := firmware_WCNSS_qcom_cfg.ini_symlink
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/firmware/wlan/prima
LOCAL_MODULE_STEM := WCNSS_qcom_cfg.ini
include $(BUILD_SYSTEM)/base_rules.mk
$(LOCAL_BUILT_MODULE): $(TARGET_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini
	@mkdir -p $(dir $@)
	$(hide) ln -sf /vendor/etc/wifi/WCNSS_qcom_cfg.ini $@

include $(CLEAR_VARS)
LOCAL_MODULE := firmware_WCNSS_wlan_dictionary.dat_symlink
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/firmware/wlan/prima
LOCAL_MODULE_STEM := WCNSS_wlan_dictionary.dat
include $(BUILD_SYSTEM)/base_rules.mk
$(LOCAL_BUILT_MODULE):
	@mkdir -p $(dir $@)
	$(hide) ln -sf /mnt/vendor/persist/WCNSS_wlan_dictionary.dat $@

include $(CLEAR_VARS)
LOCAL_MODULE := system_ext_priv-app_ims_lib_arm64_libimscamera_jni_so
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_SYSTEM_EXT)/priv-app/ims/lib/arm64
LOCAL_MODULE_STEM := libimscamera_jni.so
include $(BUILD_SYSTEM)/base_rules.mk
$(LOCAL_BUILT_MODULE): $(TARGET_OUT_SYSTEM_EXT)/lib64/libimscamera_jni.so
	@mkdir -p $(dir $@)
	$(hide) ln -sf /system_ext/lib64/libimscamera_jni.so $@

include $(CLEAR_VARS)
LOCAL_MODULE := system_ext_priv-app_ims_lib_arm64_libimsmedia_jni_so
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_SYSTEM_EXT)/priv-app/ims/lib/arm64
LOCAL_MODULE_STEM := libimsmedia_jni.so
include $(BUILD_SYSTEM)/base_rules.mk
$(LOCAL_BUILT_MODULE): $(TARGET_OUT_SYSTEM_EXT)/lib64/libimsmedia_jni.so
	@mkdir -p $(dir $@)
	$(hide) ln -sf /system_ext/lib64/libimsmedia_jni.so $@

include $(CLEAR_VARS)
LOCAL_MODULE := CneApp.libvndfwk_detect_jni.qti_symlink
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/app/CneApp/lib/arm64
LOCAL_MODULE_STEM := libvndfwk_detect_jni.qti.so
include $(BUILD_SYSTEM)/base_rules.mk
$(LOCAL_BUILT_MODULE): $(TARGET_OUT_VENDOR)/lib64/libvndfwk_detect_jni.qti_vendor.so
	@mkdir -p $(dir $@)
	$(hide) ln -sf /vendor/lib64/libvndfwk_detect_jni.qti_vendor.so $@
