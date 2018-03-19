################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="mkbootimg"
PKG_VERSION="6668fc24a3"
PKG_SITE="https://github.com/codesnake/mkbootimg"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"

makeinstall_host() {
  mkdir -p $TOOLCHAIN/bin
  cp mkbootimg $TOOLCHAIN/bin
}
