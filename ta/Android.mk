LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
ifeq ($(TARGET_ENABLE_TA_SIGN), true)
ifeq ($(TARGET_ENABLE_TA_ENCRYPT), true)
ENCRYPT := --encrypt=1
else
ENCRYPT := --encrypt=0
endif
$(info $(shell mkdir $(ANDROID_BUILD_TOP)/$(LOCAL_PATH)/signed))
$(info $(shell $(ANDROID_BUILD_TOP)/vendor/amlogic/tdk/ta_export/scripts/sign_ta_auto.py \
		--in=$(ANDROID_BUILD_TOP)/$(LOCAL_PATH)/ff2a4bea-ef6d-11e6-89ccd4ae52a7b3b3.ta \
		--out=$(ANDROID_BUILD_TOP)/$(LOCAL_PATH)/signed/ff2a4bea-ef6d-11e6-89ccd4ae52a7b3b3.ta \
		$(ENCRYPT)))
LOCAL_SRC_FILES := signed/ff2a4bea-ef6d-11e6-89ccd4ae52a7b3b3.ta
else
LOCAL_SRC_FILES := ff2a4bea-ef6d-11e6-89ccd4ae52a7b3b3.ta
endif

LOCAL_MODULE := ff2a4bea-ef6d-11e6-89ccd4ae52a7b3b3
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .ta
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/system/lib/teetz
LOCAL_STRIP_MODULE := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := tee_hdcp_ta
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_REQUIRED_MODULES := ff2a4bea-ef6d-11e6-89ccd4ae52a7b3b3
include $(BUILD_PHONY_PACKAGE)
