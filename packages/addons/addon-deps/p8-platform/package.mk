################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="p8-platform"
PKG_VERSION="2.1.0.1"
PKG_SITE="https://github.com/Pulse-Eight/platform"
PKG_URL="https://github.com/Pulse-Eight/platform/archive/$PKG_NAME-$PKG_VERSION.tar.gz"

PKG_CMAKE_OPTS_TARGET="-DBUILD_SHARED_LIBS=0"

post_makeinstall_target() {
  rm -rf $INSTALL/usr
}
