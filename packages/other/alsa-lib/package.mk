################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="alsa-lib"
PKG_VERSION="1.1.6"
PKG_SITE="http://www.alsa-project.org/"
PKG_URL="ftp://ftp.alsa-project.org/pub/lib/$PKG_NAME-$PKG_VERSION.tar.bz2"

PKG_CONFIGURE_OPTS_TARGET="
  --disable-shared --enable-static
  --with-plugindir=/usr/lib/alsa
  --enable-symbolic-functions
  --disable-aload
  --disable-rawmidi
  --disable-hwdep
  --disable-seq
  --disable-ucm
  --disable-topology
  --disable-alisp
  --disable-old-symbols
  --disable-python
  --without-versioned
  --without-debug
"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
