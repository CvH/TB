################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="script.module.pil"
PKG_DEPENDS_TARGET="Pillow"

make_target() {
  :
}

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_INSTALL/lib
  cp -PR $(get_pkg_build Pillow)/.install_target/usr/lib/python2.7/site-packages/* $ADDON_INSTALL/lib
}
