include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=fb-tft-gc9307
PKG_RELEASE:=1
PKG_LICENSE:=GPL-3.0

include $(INCLUDE_DIR)/package.mk

define KernelPackage/fb-tft-gc9307
  SUBMENU:=Video Support
  TITLE:=FB driver for the GC9307 LCD Controller
  FILES:= \
	$(PKG_BUILD_DIR)/fb_gc9307.ko
  AUTOLOAD:=$(call AutoLoad,09,fb_gc9307)
  DEPENDS:=+kmod-fb-tft
endef

define KernelPackage/fb-tft-gc9307/description
  FB driver for the GC9307 LCD Controller
endef

define Build/Compile
	$(KERNEL_MAKE) M="$(PKG_BUILD_DIR)" modules
endef

$(eval $(call KernelPackage,fb-tft-gc9307))