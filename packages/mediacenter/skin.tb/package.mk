################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="skin.tb"
PKG_VERSION="125f0fa914"
PKG_SITE="https://github.com/stefansaraev/skin.tb"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"

make_target() {
  :
}

makeinstall_target() {
  SKINDIR="$INSTALL/usr/share/kodi/addons/skin.tb"
  mkdir -p $SKINDIR
  cp -PR $PKG_BUILD/* $SKINDIR
}

post_makeinstall_target() {
  # remove languages
  find $INSTALL/usr/share/kodi/addons -name strings.po | grep -v "resource.language.en_gb" | xargs rm -f {} \;
}
