################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="ngrep"
PKG_VERSION="1_47"
PKG_SITE="https://github.com/jpr5/ngrep"
PKG_URL="https://github.com/jpr5/ngrep/archive/V$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="libpcap"

PKG_ADDON_REV="1"
PKG_ADDON_DESC="Network packet analyzer"

PKG_CONFIGURE_OPTS_TARGET="
  --with-pcap-includes=$SYSROOT_PREFIX/usr/include
  --disable-dropprivs
  --enable-ipv6
"

pre_configure_target() {
  rm -rf $PKG_BUILD_SUBDIR
}

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_INSTALL/bin
  cp $PKG_BUILD/ngrep $ADDON_INSTALL/bin
}