################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="strace"
PKG_VERSION="4.21"
PKG_SITE="https://github.com/strace/strace"
PKG_URL="https://github.com/strace/strace/archive/v$PKG_VERSION.tar.gz"

PKG_ADDON_REV="7"
PKG_ADDON_DESC="Diagnostic, debugging and instructional userspace utility"

pre_configure_target() {
  ./bootstrap
}

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_INSTALL/bin
  cp $PKG_BUILD/strace $ADDON_INSTALL/bin
}
