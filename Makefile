include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AnonCloud
AnonCloud_FILES = Tweak.xm
TARGET = iphone:clang::10.0

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Preferences"
