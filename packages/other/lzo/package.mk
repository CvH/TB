################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="lzo"
PKG_VERSION="2.10"
PKG_SITE="http://www.oberhumer.com/opensource/lzo"
PKG_URL="http://www.oberhumer.com/opensource/lzo/download/$PKG_NAME-$PKG_VERSION.tar.gz"

PKG_CMAKE_OPTS_TARGET="-DENABLE_STATIC=1 -DENABLE_SHARED=0"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/libexec
}
