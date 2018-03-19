################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="kodi-send"
PKG_VERSION="96820704c8"
PKG_SITE="https://github.com/stefansaraev/kodi-send"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"

PKG_ADDON_REV="0"
PKG_ADDON_DESC="simple kodi-send.py replacement"

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_INSTALL/bin
  cp $PKG_BUILD_SUBDIR/kodi-send $ADDON_INSTALL/bin
}
