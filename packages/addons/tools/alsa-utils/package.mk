################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="alsa-utils"
PKG_VERSION="1.1.6"
PKG_SITE="http://www.alsa-project.org/"
PKG_URL="ftp://ftp.alsa-project.org/pub/utils/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="alsa-lib"

PKG_ADDON_REV="4"
PKG_ADDON_DESC="ALSA Utilities"

PKG_CONFIGURE_OPTS_TARGET="
  --disable-xmlto
  --disable-alsamixer
  --disable-alsaconf
  --disable-alsaloop
  --disable-alsatest
  --disable-bat
  --disable-nls
"

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_INSTALL/bin
  cp $PKG_BUILD_SUBDIR/alsactl/alsactl $ADDON_INSTALL/bin
  cp $PKG_BUILD_SUBDIR/amixer/amixer $ADDON_INSTALL/bin
  cp $PKG_BUILD_SUBDIR/aplay/aplay $ADDON_INSTALL/bin
  cp $PKG_BUILD_SUBDIR/speaker-test/speaker-test $ADDON_INSTALL/bin
}
