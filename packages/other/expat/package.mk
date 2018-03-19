################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="expat"
PKG_VERSION="2.2.5"
PKG_SITE="http://expat.sourceforge.net/"
PKG_URL="http://prdownloads.sourceforge.net/$PKG_NAME/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.bz2"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static --with-pic"

post_unpack() {
  rm -f $PKG_BUILD/CMakeLists.txt
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
