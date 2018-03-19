################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="screen"
PKG_VERSION="4.6.2"
PKG_SITE="http://www.gnu.org/software/screen/"
PKG_URL="http://ftpmirror.gnu.org/screen/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="netbsd-curses"

PKG_ADDON_REV="6"
PKG_ADDON_DESC="GNU Screen"

PKG_CONFIGURE_OPTS_TARGET="
  --enable-colors256
  --disable-pam
  --disable-use-locale
  --disable-telnet
  --disable-socket-dir
"

pre_configure_target() {
  # for color256 with netbsd-curses
  CFLAGS="$CFLAGS -DTERMINFO"
}

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_INSTALL/bin
  cp $PKG_BUILD_SUBDIR/screen $ADDON_INSTALL/bin/screen
}
