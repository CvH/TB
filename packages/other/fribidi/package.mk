################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="fribidi"
PKG_VERSION="1.0.2"
PKG_SITE="http://fribidi.org/"
PKG_URL="https://github.com/fribidi/fribidi/releases/download/v$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.bz2"

PKG_CONFIGURE_OPTS_TARGET="
  --disable-shared --enable-static
  --disable-debug
  --disable-deprecated
  --disable-docs
"

pre_configure_target() {
  CFLAGS="$CFLAGS -DFRIBIDI_CHUNK_SIZE=4080"
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
