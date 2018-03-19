################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="netbase"
PKG_VERSION="5.4"
PKG_SITE="http://packages.debian.org/netbase"
PKG_URL="http://ftp.debian.org/debian/pool/main/n/netbase/${PKG_NAME}_${PKG_VERSION}.tar.xz"

make_target() {
  :
}

makeinstall_target() {
  mkdir -p $INSTALL/etc
  cp etc-protocols $INSTALL/etc/protocols
  cp etc-services $INSTALL/etc/services
}
