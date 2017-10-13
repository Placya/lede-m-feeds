include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-koolproxy
PKG_VERSION:=3.6.1
PKG_RELEASE:=1

PKG_MAINTAINER:=panda-mute <wxuzju@gmail.com>
PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-koolproxy
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI support for koolproxy
	DEPENDS:=+openssl-util +ipset +dnsmasq-full +@BUSYBOX_CONFIG_DIFF +iptables-mod-nat-extra +wget
	MAINTAINER:=panda-mute
endef

define Package/luci-app-koolproxy/description
	This package contains LuCI configuration pages for koolproxy.
endef

define Build/Compile
endef

define Package/luci-app-koolproxy/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
	( . /etc/uci-defaults/luci-koolproxy ) && rm -f /etc/uci-defaults/luci-koolproxy
	rm -f /tmp/luci-indexcache
fi
exit 0
endef

define Package/luci-app-koolproxy/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/adblocklist
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/koolproxy
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/koolproxy
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/usr/share/koolproxy
	$(INSTALL_DIR) $(1)/usr/share/koolproxy/data
	$(INSTALL_DIR) $(1)/usr/share/koolproxy/data/certs/
	$(INSTALL_DIR) $(1)/usr/share/koolproxy/data/rules/

	$(INSTALL_BIN) ./files/etc/uci-defaults/luci-koolproxy $(1)/etc/uci-defaults/luci-koolproxy
	$(INSTALL_BIN) ./files/etc/init.d/* $(1)/etc/init.d/
	$(INSTALL_DATA) ./files/etc/config/* $(1)/etc/config/
	$(INSTALL_DATA) ./files/etc/adblocklist/* $(1)/etc/adblocklist/
	$(INSTALL_DATA) ./files/usr/lib/lua/luci/model/cbi/koolproxy/global.lua $(1)/usr/lib/lua/luci/model/cbi/koolproxy/global.lua
	$(INSTALL_DATA) ./files/usr/lib/lua/luci/model/cbi/koolproxy/rss_rule.lua $(1)/usr/lib/lua/luci/model/cbi/koolproxy/rss_rule.lua
	$(INSTALL_DATA) ./files/usr/lib/lua/luci/controller/koolproxy.lua $(1)/usr/lib/lua/luci/controller/koolproxy.lua
	$(INSTALL_DATA) ./files/usr/lib/lua/luci/view/koolproxy/* $(1)/usr/lib/lua/luci/view/koolproxy/
	$(INSTALL_DATA) ./files/usr/lib/lua/luci/i18n/koolproxy.zh-cn.lmo $(1)/usr/lib/lua/luci/i18n/koolproxy.zh-cn.lmo
	$(INSTALL_BIN) ./files/usr/sbin/* $(1)/usr/sbin/
	$(INSTALL_DATA) ./files/usr/share/koolproxy/data/certs/* $(1)/usr/share/koolproxy/data/certs
	$(INSTALL_BIN) ./files/usr/share/koolproxy/data/gen_ca.sh $(1)/usr/share/koolproxy/data/
	$(INSTALL_DATA) ./files/usr/share/koolproxy/data/openssl.cnf $(1)/usr/share/koolproxy/data/
	$(INSTALL_DATA) ./files/usr/share/koolproxy/data/user.txt $(1)/usr/share/koolproxy/data/
	$(INSTALL_DATA) ./files/usr/share/koolproxy/data/rules/* $(1)/usr/share/koolproxy/data/rules/
	$(INSTALL_BIN) ./files/usr/share/koolproxy/camanagement $(1)/usr/share/koolproxy/camanagement
	$(INSTALL_BIN) ./files/usr/share/koolproxy/firewall.include $(1)/usr/share/koolproxy/firewall.include
	$(INSTALL_BIN) ./files/usr/share/koolproxy/koolproxyupdate $(1)/usr/share/koolproxy/koolproxyupdate
	$(INSTALL_DATA) ./files/usr/share/koolproxy/adblock.conf $(1)/usr/share/koolproxy/adblock.conf
	$(INSTALL_DATA) ./files/usr/share/koolproxy/dnsmasq.adblock $(1)/usr/share/koolproxy/dnsmasq.adblock
ifeq ($(ARCH),mipsel)
	$(INSTALL_BIN) ./files/bin/mipsel $(1)/usr/share/koolproxy/koolproxy
endif
ifeq ($(ARCH),mips)
	$(INSTALL_BIN) ./files/bin/mips $(1)/usr/share/koolproxy/koolproxy
endif
ifeq ($(ARCH),i386)
	$(INSTALL_BIN) ./files/bin/i386 $(1)/usr/share/koolproxy/koolproxy
endif
ifeq ($(ARCH),x86_64)
	$(INSTALL_BIN) ./files/bin/x86_64 $(1)/usr/share/koolproxy/koolproxy
endif
ifeq ($(ARCH),arm)
	$(INSTALL_BIN) ./files/bin/arm $(1)/usr/share/koolproxy/koolproxy
endif
endef

$(eval $(call BuildPackage,luci-app-koolproxy))
