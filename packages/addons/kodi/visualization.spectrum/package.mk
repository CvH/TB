################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="visualization.spectrum"
PKG_VERSION="b533965055"
PKG_SITE="https://github.com/xbmc/visualization.spectrum"
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
