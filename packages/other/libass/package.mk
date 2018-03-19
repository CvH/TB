################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="libass"
PKG_VERSION="0.14.0"
PKG_SITE="https://github.com/libass/libass"
PKG_URL="https://github.com/libass/libass/releases/download/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="freetype fribidi"

PKG_CONFIGURE_OPTS_TARGET="
  --disable-test
  --disable-fontconfig
  --disable-require-system-font-provider
  --disable-harfbuzz
"

post_makeinstall_target() {
  rm -rf $INSTALL/usr
}
