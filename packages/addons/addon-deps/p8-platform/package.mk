# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="p8-platform"
PKG_VERSION="2.1.0.1"
PKG_SITE="https://github.com/Pulse-Eight/platform"
PKG_WATCH="https://github.com/Pulse-Eight/platform/releases/ .*/archive/p8-platform-([\d\.]*)\.tar\.gz"
PKG_URL="https://github.com/Pulse-Eight/platform/archive/$PKG_NAME-$PKG_VERSION.tar.gz"

PKG_CMAKE_OPTS_TARGET="-DBUILD_SHARED_LIBS=0"

post_makeinstall_target() {
  rm -rf $INSTALL/usr
}
