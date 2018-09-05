# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="kodi-send"
PKG_VERSION="96820704c8"
PKG_SITE="https://github.com/stefansaraev/kodi-send"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/kodi-send $INSTALL/usr/bin
}
