################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="evtest"
PKG_VERSION="1.33"
PKG_SITE="http://cgit.freedesktop.org/evtest/"
PKG_URL="http://cgit.freedesktop.org/evtest/snapshot/$PKG_NAME-$PKG_VERSION.tar.bz2"

PKG_ADDON_REV="0"
PKG_ADDON_DESC="Simple tool for input event debugging"

PKG_AUTORECONF="yes"

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_INSTALL/bin
  cp $PKG_BUILD_SUBDIR/evtest $ADDON_INSTALL/bin
}
