################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="libpng"
PKG_VERSION="1.6.34"
PKG_SITE="https://github.com/glennrp/libpng"
PKG_URL="https://github.com/glennrp/libpng/archive/v$PKG_VERSION.tar.gz"

PKG_CMAKE_OPTS_TARGET="-DPNG_SHARED=OFF -DPNG_STATIC=ON"

post_makeinstall_target() {
  rm -rf $INSTALL/usr
  rm -rf $SYSROOT_PREFIX/usr/bin/libpng*-config
}
