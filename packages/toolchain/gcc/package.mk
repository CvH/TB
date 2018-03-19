################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="gcc"
PKG_VERSION="7.3.0"
PKG_SITE="http://gcc.gnu.org/"
PKG_URL="http://ftpmirror.gnu.org/gcc/$PKG_NAME-$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_BOOTSTRAP="binutils:host gmp:host mpfr:host mpc:host"
PKG_DEPENDS_HOST="glibc"

GCC_COMMON_CONFIGURE_OPTS="
  --target=$TARGET_NAME
  --with-sysroot=$SYSROOT_PREFIX
  --with-gmp=$TOOLCHAIN
  --with-mpfr=$TOOLCHAIN
  --with-mpc=$TOOLCHAIN
  --disable-shared --enable-static --with-pic
  --without-ppl
  --without-cloog
  --disable-libada
  --disable-libmudflap
  --disable-gold
  --disable-lto
  --disable-libquadmath
  --disable-libatomic
  --disable-libitm
  --disable-libssp
  --disable-libgomp
  --disable-multilib
  --disable-nls
  --disable-libsanitizer
"

PKG_CONFIGURE_OPTS_BOOTSTRAP="
  $GCC_COMMON_CONFIGURE_OPTS
  --enable-languages=c
  --disable-threads
  --without-headers
  --with-newlib
  --disable-decimal-float
  $GCC_OPTS
"

PKG_CONFIGURE_OPTS_HOST="
  $GCC_COMMON_CONFIGURE_OPTS
  --enable-languages=c,c++
  --disable-libstdcxx-pch
  $GCC_OPTS
"

makeinstall_bootstrap() {
  make install
}
