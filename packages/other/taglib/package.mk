################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="taglib"
PKG_VERSION="1.11.1"
PKG_SITE="http://taglib.github.com/"
PKG_URL="http://taglib.github.io/releases/$PKG_NAME-$PKG_VERSION.tar.gz"

PKG_CMAKE_OPTS_TARGET="-DBUILD_SHARED_LIBS=0"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
