# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="keytable"
PKG_VERSION="950397fb85"
PKG_SITE="https://github.com/stefansaraev/keytable"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD/keytable $INSTALL/usr/bin
}
