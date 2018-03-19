################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="sqlite"
PKG_VERSION="autoconf-3230100"
PKG_SITE="https://www.sqlite.org/"
PKG_URL="https://www.sqlite.org/2018/$PKG_NAME-$PKG_VERSION.tar.gz"

PKG_CONFIGURE_OPTS_TARGET="
  --disable-shared --enable-static
  --disable-readline
  --enable-threadsafe
  --disable-dynamic-extensions
"

pre_configure_target() {
  CFLAGS="$CFLAGS -DSQLITE_CONFIG_MEMSTATUS=0"
  CFLAGS="$CFLAGS -DSQLITE_ENABLE_STAT3"
  CFLAGS="$CFLAGS -DSQLITE_TEMP_STORE=3 -DSQLITE_DEFAULT_MMAP_SIZE=268435456"

  CFLAGS="$CFLAGS -fPIC"
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
