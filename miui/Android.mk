LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

MIUI_VERSION := 4.0.0
ifndef MIUI_NAME
    MIUI_NAME := MIUI REC by LaoYang 
endif
MIUI_BUILD := $(shell date +"%Y-%M-%d")



libmiui_common_includes = $(LOCAL_PATH)/include \
			  external/zlib \
			  external/freetype/build \
			  external/freetype/include
libmiui_common_src_files := \
    libs/minutf8/minutf8.c \
    src/edify/lex.yy.c \
	src/edify/parser.c \
	src/edify/expr.c \
    src/libs/miui_array.c \
    src/libs/miui_freetype.c \
    src/libs/miui_graph.c \
    src/libs/miui_input.c \
    src/libs/miui_languages.c \
    src/libs/miui_libs.c \
    src/libs/miui_png.c \
    src/controls/miui_control_button.c \
    src/controls/miui_control_check.c \
    src/controls/miui_control_optbox.c \
    src/controls/miui_control_textbox.c \
    src/controls/miui_control_checkbox.c \
    src/controls/miui_control_menubox.c \
    src/controls/miui_control_sdmenu.c \
    src/controls/miui_control_title.c \
    src/controls/miui_controls.c \
    src/controls/miui_control_threads.c \
    src/main/miui_ui.c \
    src/main/common_ui.c \
    src/main/lang_ui.c \
    src/main/sd_file.c \
    src/main/sd_ui.c \
    src/main/power_ui.c \
    src/main/mount_ui.c \
    src/main/wipe_ui.c \
    src/main/backup_ui.c \
    src/main/info_ui.c \
    src/main/menu_node.c \
    src/main/miui_installer.c \
    src/main/miui.c \
    src/main/root_ui.c 

ifeq ($(ENABLE_LOKI_RECOVERY),true)
   LOCAL_CFLAGS += -DENABLE_LOKI
   LOCAL_SRC_FILES += \
		      loki/loki_flash.c \
		      loki/loki_patch.c \
		      loki/loki_recovery.c 
endif



LOCAL_SRC_FILES := \
    $(libmiui_common_src_files) \
    ../miui_intent.c 
LOCAL_C_INCLUDES += $(libmiui_common_includes) \
		    external/freetype/build \
		    external/freetype/include \
		    external/libpng
LOCAL_CFLAGS := $(MYDEFINE_CFLAGS)
LOCAL_CFLAGS += -DDEBUG
#LOCAL_CFLAGS += -fPIC -DPIC
LOCAL_CFLAGS += -I$(LOCAL_PATH)/include \
		-I$(LOCAL_PATH)/../../../external/freetype/include \
		-I$(LOCAL_PATH)/../../../external/freetype/builds \
		-I$(LOCAL_PATH)/../../../external/zlib \
		-I$(LOCAL_PATH)/../../../external/libpng
#LOCAL_CFLAGS += -D_MIUI_NODEBUG
ifeq ($(BUILD_CHN_REC),)
	LOCAL_CFLAGS := -DBUILD_CHN_REC
endif

ifeq ($(TARGET_RECOVERY_PIXEL_FORMAT), "RGBX_8888")
	LOCAL_CFLAGS += -DGGL_PIXEL_FORMAT_RGBX_8888
endif
ifeq ($(TARGET_RECOVERY_PIXEL_FORMAT), "BGRA_8888")
	LOCAL_CFLAGS += -DGGL_PIXEL_FORMAT_BGRA_8888
endif
ifeq ($(TARGET_RECOVERY_PIXEL_FORMAT), "BGR_565")
	LOCAL_CFLAGS += -DPIXEL_FORMAT_BGR_565 
endif

ifeq ($(BOARD_HAS_FLIPPED_SCREEN), true)
    LOCAL_CFLAGS += -DBOARD_HAS_FLIPPED_SCREEN
endif

LOCAL_CFLAGS += -DCONST_MIUI_BUILD="$(MIUI_BUILD)"
LOCAL_CFLAGS += -DCONST_MIUI_VERSION="$(MIUI_VERSION)"
LOCAL_CFLAGS += -DCONST_MIUI_NAME="$(MIUI_NAME)"


LOCAL_SHARED_LIBRARIES += libc libm libz
LOCAL_STATIC_LIBRARIES := libft2 libpng libiniparser 
LOCAL_MODULE := libmiui
LOCAL_MODULE_TAGS := eng

#include $(BUILD_SHARED_LIBRARY)
include $(BUILD_STATIC_LIBRARY)


