################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="ethtool"
PKG_VERSION="4.15"
PKG_SITE="http://www.kernel.org/pub/software/network/ethtool/"
PKG_URL="http://www.kernel.org/pub/software/network/ethtool/$PKG_NAME-$PKG_VERSION.tar.xz"

PKG_ADDON_REV="4"
PKG_ADDON_DESC="Display or change ethernet card settings"

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_INSTALL/bin
  cp $PKG_BUILD_SUBDIR/ethtool $ADDON_INSTALL/bin
}
