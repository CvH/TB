################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="libressl"
PKG_VERSION="2.7.2"
PKG_SITE="http://www.libressl.org/"
PKG_URL="http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/$PKG_NAME-$PKG_VERSION.tar.gz"

PKG_CMAKE_OPTS_TARGET="
  -DOPENSSLDIR=/etc/ssl
  -DLIBRESSL_APPS=ON
  -DLIBRESSL_TESTS=OFF
  -DBUILD_SHARED_LIBS=ON
"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
  rm -rf $INSTALL/etc/ssl/*.cnf
}
