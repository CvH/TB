################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="pcre"
PKG_VERSION="8.42"
PKG_SITE="http://www.pcre.org/"
PKG_URL="https://ftp.pcre.org/pub/pcre/$PKG_NAME-$PKG_VERSION.tar.bz2"

PKG_CMAKE_OPTS_TARGET="
  -DPCRE_BUILD_PCRE16=ON
  -DPCRE_SUPPORT_UTF=ON
  -DPCRE_SUPPORT_UNICODE_PROPERTIES=ON
"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
