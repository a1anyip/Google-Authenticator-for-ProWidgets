export THEOS_DEVICE_IP=127.0.0.1
export THEOS_DEVICE_PORT=2222

export TARGET = :clang
export ARCHS = armv7 arm64

BUNDLE_NAME = GoogleAuthenticator
GoogleAuthenticator_FILES = Authenticator.m ViewController.m Theme.m Cell.m
GoogleAuthenticator_INSTALL_PATH = /Library/ProWidgets/Widgets/
GoogleAuthenticator_FRAMEWORKS = UIKit CoreGraphics QuartzCore
GoogleAuthenticator_LIBRARIES = prowidgets objcipc
GoogleAuthenticator_BUNDLE_EXTENSION = widget

SUBPROJECTS = AuthenticatorSubstrate

include theos/makefiles/common.mk
include $(THEOS_MAKE_PATH)/bundle.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

after-stage::
	$(ECHO_NOTHING)find $(THEOS_STAGING_DIR) -iname '*.psd' -exec rm -rfv {} + $(ECHO_END)
	$(ECHO_NOTHING)find $(THEOS_STAGING_DIR) -iname '*.bak' -exec rm -rfv {} + $(ECHO_END)

after-install::
	install.exec "killall -9 backboardd"