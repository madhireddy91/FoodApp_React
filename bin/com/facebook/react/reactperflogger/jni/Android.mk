# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

# Header search path for all source files in this module.
LOCAL_C_INCLUDES := $(LOCAL_PATH)/reactperflogger

# Header search path for modules that depend on this module
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)

LOCAL_CFLAGS += -fexceptions -frtti -std=c++17 -Wall

LOCAL_LDLIBS += -landroid

LOCAL_STATIC_LIBRARIES = libreactperflogger

LOCAL_SHARED_LIBRARIES = libfb libfbjni

# Name of this module.
LOCAL_MODULE := reactperfloggerjni

# Compile all local c++ files
LOCAL_SRC_FILES := $(wildcard $(LOCAL_PATH)/reactperflogger/*.cpp)
LOCAL_SRC_FILES := $(subst $(LOCAL_PATH)/,,$(LOCAL_SRC_FILES))

# Build the files in this directory as a shared library
include $(BUILD_SHARED_LIBRARY)
