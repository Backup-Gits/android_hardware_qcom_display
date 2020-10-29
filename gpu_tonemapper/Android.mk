LOCAL_PATH := $(call my-dir)
include $(LOCAL_PATH)/../common.mk

include $(CLEAR_VARS)
LOCAL_MODULE                := tonemapper.$(TARGET_BOARD_PLATFORM)_headers
LOCAL_VENDOR_MODULE         := true
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include
include $(BUILD_HEADER_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE              := libgpu_tonemapper
LOCAL_VENDOR_MODULE       := true
LOCAL_MODULE_TAGS         := optional
LOCAL_HEADER_LIBRARIES    := display_headers
LOCAL_C_INCLUDES          := $(TARGET_OUT_HEADERS)/qcom/display/
LOCAL_C_INCLUDES          += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_SHARED_LIBRARIES    := libEGL libGLESv2 libGLESv3 libui libutils liblog
LOCAL_ADDITIONAL_DEPENDENCIES := $(common_deps) $(kernel_deps)
LOCAL_EXPORT_HEADER_LIBRARY_HEADERS := tonemapper.$(TARGET_BOARD_PLATFORM)_headers

LOCAL_CFLAGS              := $(version_flag) -Wno-missing-field-initializers -Wall \
                             -Wno-unused-parameter -DLOG_TAG=\"GPU_TONEMAPPER\"

LOCAL_SRC_FILES           := TonemapFactory.cpp \
                             glengine.cpp \
                             EGLImageBuffer.cpp \
                             EGLImageWrapper.cpp \
                             Tonemapper.cpp

include $(BUILD_SHARED_LIBRARY)
