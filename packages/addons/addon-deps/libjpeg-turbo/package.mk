################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="libjpeg-turbo"
PKG_VERSION="1.5.3"
PKG_SITE="https://github.com/libjpeg-turbo/libjpeg-turbo"
PKG_URL="http://prdownloads.sourceforge.net/libjpeg-turbo/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"

PKG_CONFIGURE_OPTS_TARGET="
  --disable-shared --enable-static --with-pic
  --with-jpeg8
"

post_unpack() {
  rm -f $PKG_BUILD/CMakeLists.txt
}
