include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-xgp-v3-screen-brightness
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_LICENSE:=MIT
PKG_MAINTAINER:=zzzz0317

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-xgp-v3-screen-brightness
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=XiGuaPi v3 Screen Brightness Control
  DEPENDS:=+luci-base
  PKGARCH:=all
endef

define Package/luci-app-xgp-v3-screen-brightness/description
  Simple XiGuaPi v3 screen brightness control for OpenWrt LuCI
endef

define Build/Compile
endef

define Package/luci-app-xgp-v3-screen-brightness/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./luasrc/controller/screen_brightness.lua $(1)/usr/lib/lua/luci/controller/
	
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DATA) ./luasrc/model/cbi/screen_brightness.lua $(1)/usr/lib/lua/luci/model/cbi/
	
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./root/etc/config/screen_brightness $(1)/etc/config/
	
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/screen_brightness $(1)/etc/init.d/
	
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) ./root/bin/set-xgp-screen-brightness $(1)/bin/
endef

$(eval $(call BuildPackage,luci-app-xgp-v3-screen-brightness))