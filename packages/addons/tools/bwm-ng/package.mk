################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="bwm-ng"
PKG_VERSION="0.6.1"
PKG_SITE="https://github.com/vgropp/bwm-ng"
PKG_URL="https://github.com/vgropp/bwm-ng/releases/download/v$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="netbsd-curses"

PKG_ADDON_REV="0"
PKG_ADDON_DESC="Console-based live network and disk io bandwidth monitor"

PKG_CONFIGURE_OPTS_TARGET="
  --with-time
  --with-getifaddrs
  --with-sysctl
  --with-sysctldisk
  --with-procnetdev
  --with-partitions
"

pre_configure_target() {
  export LIBS="-lcurses -lterminfo"
}

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_INSTALL/bin
  cp $PKG_BUILD_SUBDIR/src/bwm-ng $ADDON_INSTALL/bin
}
