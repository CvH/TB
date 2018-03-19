################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="tcpdump"
PKG_VERSION="4.9.2"
PKG_SITE="http://www.tcpdump.org/"
PKG_URL="http://www.tcpdump.org/release/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="libpcap"

PKG_ADDON_REV="3"
PKG_ADDON_DESC="Network packet analyzer"

PKG_CONFIGURE_OPTS_TARGET="
  --disable-smb
  --without-smi
  --with-crypto=no
"

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_INSTALL/bin
  cp $PKG_BUILD_SUBDIR/tcpdump $ADDON_INSTALL/bin
}
