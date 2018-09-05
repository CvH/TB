# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="opengl-meson-gxbb"
PKG_VERSION="r7p0-01rel0"
PKG_SITE="http://openlinux.amlogic.com:8000/download/ARM/filesystem/"
PKG_URL="http://sources.libreelec.tv/devel/$PKG_NAME-$PKG_VERSION.tar.xz"

make_target() {
  :
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/include
  cp -PR usr/include/* $SYSROOT_PREFIX/usr/include

  mkdir -p $SYSROOT_PREFIX/usr/lib
  cp -PR usr/lib/libMali.so $SYSROOT_PREFIX/usr/lib
  ln -sf libMali.so $SYSROOT_PREFIX/usr/lib/libEGL.so
  ln -sf libMali.so $SYSROOT_PREFIX/usr/lib/libGLESv2.so

  mkdir -p $INSTALL/usr/lib
  cp -PR usr/lib/libMali.so $INSTALL/usr/lib
  ln -sf libMali.so $INSTALL/usr/lib/libEGL.so
  ln -sf libMali.so $INSTALL/usr/lib/libGLESv2.so
}
