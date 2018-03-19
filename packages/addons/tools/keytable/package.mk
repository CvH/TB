################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="keytable"
PKG_VERSION="950397fb85"
PKG_SITE="https://github.com/stefansaraev/keytable"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"

PKG_ADDON_REV="0"
PKG_ADDON_DESC="tool to get/set keycode/scancode tables"

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_INSTALL/bin
  cp $PKG_BUILD/keytable $ADDON_INSTALL/bin
}
