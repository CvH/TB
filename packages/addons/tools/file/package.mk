################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="file"
PKG_VERSION="5.32"
PKG_SITE="http://www.darwinsys.com/file/"
PKG_URL="ftp://ftp.astron.com/pub/file/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="file:host"

PKG_ADDON_REV="3"
PKG_ADDON_DESC="The file utility is used to determine the types of various files"

PKG_CONFIGURE_OPTS_HOST="--disable-shared --enable-static"
PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static"

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_INSTALL/bin
  cp -R $PKG_BUILD_SUBDIR/src/file $ADDON_INSTALL/bin
  mkdir -p $ADDON_INSTALL/data
  cp -R $PKG_BUILD_SUBDIR/magic/magic.mgc $ADDON_INSTALL/data
}
