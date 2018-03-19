################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="kodi-platform"
PKG_VERSION="e8574b883f"
PKG_SITE="https://github.com/xbmc/kodi-platform"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="tinyxml kodi p8-platform"

PKG_CMAKE_OPTS_TARGET="
  -DCMAKE_MODULE_PATH=$SYSROOT_PREFIX/usr/share/kodi/cmake
  -DBUILD_SHARED_LIBS=0
"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/lib/kodiplatform
}
