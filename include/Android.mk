LOCAL_PATH:= $(call my-dir)
include $(LOCAL_PATH)/../common.mk

LOCAL_EXPORT_HEADER_LIBRARY_HEADERS := include.$(TARGET_BOARD_PLATFORM)_headers

include $(CLEAR_VARS)

# Legacy header copy. This is deprecated.
# Modules using these headers should shift to using
LOCAL_MODULE := include.$(TARGET_BOARD_PLATFORM)_headers
LOCAL_VENDOR_MODULE           := true
LOCAL_EXPORT_C_INCLUDE_DIRS   := $(LOCAL_PATH)/include
include $(BUILD_HEADER_LIBRARY)
