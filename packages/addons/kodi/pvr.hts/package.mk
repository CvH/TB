# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="pvr.hts"
PKG_VERSION="dc35ade7b4"
PKG_SITE="https://github.com/kodi-pvr/pvr.hts"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="kodi-platform"

PKG_CMAKE_OPTS_TARGET="
  -DCMAKE_MODULE_PATH=$SYSROOT_PREFIX/usr/share/kodi/cmake
  -DKODI_INCLUDE_DIR=$SYSROOT_PREFIX/usr/include/kodi
"

addon() {
  mkdir -p $ADDON_INSTALL
  cp -R $INSTALL/usr/share/kodi/addons/$PKG_NAME/* $ADDON_INSTALL
  cp -L $INSTALL/usr/lib/kodi/addons/$PKG_NAME/*.so $ADDON_INSTALL
}
