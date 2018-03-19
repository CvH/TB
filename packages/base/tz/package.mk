################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="tz"
PKG_VERSION="2018d"
PKG_SITE="https://www.iana.org/time-zones"
PKG_URL="https://github.com/eggert/tz/archive/$PKG_VERSION.tar.gz"

PKG_MAKE_OPTS_TARGET="CC=$HOST_CC LDFLAGS="

makeinstall_target() {
  make TZDIR="$INSTALL/usr/share/zoneinfo" REDO=posix_only TOPDIR="$INSTALL" install
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
  rm -rf $INSTALL/usr/sbin
  rm -rf $INSTALL/etc
  mkdir -p $INSTALL/etc
  ln -sf /storage/.config/localtime $INSTALL/etc/localtime
}
