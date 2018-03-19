################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="mediainfo"
PKG_VERSION="18.03.1"
PKG_SITE="http://mediaarea.net/en/MediaInfo/Download/Source"
PKG_URL="https://mediaarea.net/download/binary/mediainfo/${PKG_VERSION}/MediaInfo_CLI_${PKG_VERSION}_GNU_FromSource.tar.gz"

PKG_ADDON_REV="8"
PKG_ADDON_DESC="Displays extended information on media files"

make_target() {
  ./CLI_Compile.sh \
    --host=$TARGET_NAME \
    --build=$HOST_NAME \
    --prefix=/usr
}

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_INSTALL/bin
  cp $PKG_BUILD/MediaInfo/Project/GNU/CLI/mediainfo $ADDON_INSTALL/bin
}
