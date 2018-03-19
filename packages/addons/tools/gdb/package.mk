################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="gdb"
PKG_VERSION="8.1"
PKG_SITE="http://www.gnu.org/software/gdb/"
PKG_URL="http://ftpmirror.gnu.org/gdb/$PKG_NAME-$PKG_VERSION.tar.xz"

PKG_ADDON_REV="5"
PKG_ADDON_DESC="The GNU Project Debugger"

PKG_CONFIGURE_OPTS_TARGET="
  bash_cv_have_mbstate_t=set
  --disable-shared --enable-static
  --with-auto-load-safe-path=/
  --datarootdir=/storage/.extra/data
  --enable-gdbcli
  --disable-gdbmi
  --disable-tui
  --disable-gdbtk
  --disable-profiling
  --disable-rpath
  --disable-libmcheck
  --disable-sim
  --disable-multi-ice
  --disable-gdbserver
  --without-curses
  --with-system-zlib
  --without-libiconv-prefix
  --without-expat
  --without-mpfr
  --without-python
  --without-guile
  --without-lzma
  --without-tcl
  --without-tk
  --without-x
  --without-babeltrace
"

pre_configure_target() {
  export CC_FOR_BUILD="$HOST_CC"
  export CFLAGS_FOR_BUILD="$HOST_CFLAGS"
}

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_INSTALL/bin
  cp $PKG_BUILD_SUBDIR/gdb/gdb $ADDON_INSTALL/bin

  mkdir -p $ADDON_INSTALL/data/gdb
  cp -R $PKG_BUILD_SUBDIR/gdb/data-directory/syscalls $ADDON_INSTALL/data/gdb
}
