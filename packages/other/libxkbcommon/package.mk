# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="libxkbcommon"
PKG_VERSION="0.8.2"
PKG_SITE="https://www.xkbcommon.org/"
PKG_WATCH="http://xkbcommon.org/download/ libxkbcommon-(.*)\.tar\.xz"
PKG_URL="https://xkbcommon.org/download/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="xkeyboard-config"

PKG_CONFIGURE_OPTS_TARGET="
  --disable-shared --enable-static
  --disable-x11 --disable-docs
"
