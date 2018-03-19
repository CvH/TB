################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="bzip2"
PKG_VERSION="1.0.6"
PKG_SITE="http://www.bzip.org"
PKG_URL="http://www.bzip.org/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"

make_target() {
  make CC=$CC CFLAGS="$CFLAGS -fPIC" libbz2.a
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/include
  cp bzlib.h $SYSROOT_PREFIX/usr/include

  mkdir -p $SYSROOT_PREFIX/usr/lib
  cp -P libbz2.a* $SYSROOT_PREFIX/usr/lib
}
