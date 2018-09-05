# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="libamcodec"
PKG_VERSION="bb19db7"
PKG_SITE="https://github.com/surkovalex/libamcodec/tree/20170630"
PKG_URL="https://github.com/surkovalex/libamcodec/archive/$PKG_VERSION.tar.gz"

post_unpack() {
  sed -e "s|-lamadec||g" -i $PKG_BUILD/amcodec/Makefile
}

make_target() {
  mkdir -p $SYSROOT_PREFIX/usr/lib
  make HEADERS_DIR="$SYSROOT_PREFIX/usr/include/amcodec" PREFIX="$SYSROOT_PREFIX/usr" -C amcodec install
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib
  make HEADERS_DIR="$INSTALL/usr/include/amcodec" PREFIX="$INSTALL/usr" -C amcodec install
}
