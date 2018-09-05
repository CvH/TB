# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="skin.tb"
PKG_VERSION="897a9a928e"
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
