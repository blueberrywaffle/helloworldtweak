THEOS_DEVICE_IP = 192.168.1.92

TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HelloWorldTweak

HelloWorldTweak_FILES = Tweak.x
HelloWorldTweak_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

$(TWEAK_NAME)_FRAMEWORKS = AudioToolbox

SUBPROJECTS += helloworldtweakpreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
