TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = HelloWorldTweakPreferences

HelloWorldTweakPreferences_FILES = EGKRootListController.m
HelloWorldTweakPreferences_FRAMEWORKS = UIKit
HelloWorldTweakPreferences_PRIVATE_FRAMEWORKS = Preferences
HelloWorldTweakPreferences_INSTALL_PATH = /Library/PreferenceBundles
HelloWorldTweakPreferences_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
