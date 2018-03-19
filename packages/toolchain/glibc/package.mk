################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="glibc"
PKG_VERSION="2.27"
PKG_SITE="http://www.gnu.org/software/libc/"
PKG_URL="https://ftp.gnu.org/gnu/glibc/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="linux:host gcc:bootstrap"
PKG_DEPENDS_INIT="glibc"

PKG_CONFIGURE_OPTS_TARGET="
  BASH_SHELL=/bin/sh
  libc_cv_slibdir=/usr/lib
  libc_cv_rtlddir=/lib
  ac_cv_path_PERL=
  ac_cv_prog_MAKEINFO=
  --libexecdir=/usr/lib/glibc
  --cache-file=config.cache
  --disable-sanity-checks
  --enable-kernel=3.0.0
  --disable-timezone-tools
  --enable-bind-now
  --disable-build-nscd
  --disable-nscd
  --without-gd
  --with-binutils=$TOOLCHAIN/bin
  --with-headers=$SYSROOT_PREFIX/usr/include
  --with-default-link
"

pre_configure_target() {
  export LDFLAGS=`echo $LDFLAGS | sed -e "s|-Wl,--gc-sections||g"`

  export BUILD_CC=$HOST_CC
  export OBJDUMP_FOR_HOST=objdump

  export CFLAGS="$CFLAGS -fPIC"

  echo "sbindir=/usr/bin" >> configparms
  echo "rootsbindir=/usr/bin" >> configparms

  aclocal --force --verbose
  autoconf --force --verbose
}

post_makeinstall_target() {
  # cleanup
  EXCLUDE="catchsegv gencat getent getconf iconv iconvconfig ldconfig locale localedef
           makedb pcprofiledump pldd rpcgen sln sotruss sprof xtrace"
  for i in $EXCLUDE; do rm -rf $INSTALL/usr/bin/$i ; done

  EXCLUDE="audit glibc libnss_compat libnss_db libnss_hesiod
           libSegFault libmemusage libpcprofile"
  for i in $EXCLUDE; do rm -rf $INSTALL/usr/lib/$i* ; done

  # static libs
  EXCLUDE="libanl libcidn libcrypt libnsl libutil libBrokenLocale"
  for i in $EXCLUDE; do rm -f {$INSTALL,$SYSROOT_PREFIX}/usr/lib/$i{-$PKG_VERSION,}.so* ; done

  # remove ldscripts
  rm -rf $INSTALL/usr/lib/libc.so
  rm -rf $INSTALL/usr/lib/libpthread.so

  # remove locales and charmaps
  rm -rf $INSTALL/usr/share/i18n

  # gconv modules
  rm -rf $INSTALL/usr/lib/gconv
  mkdir -p $INSTALL/usr/lib/gconv

  GCONV_MODULES="CP1251 IBM437 UNICODE UTF-7 UTF-16 UTF-32"
  for i in $GCONV_MODULES ; do
    cp $PKG_BUILD_SUBDIR/iconvdata/$i.so $INSTALL/usr/lib/gconv
    sh $PKG_DIR/scripts/expunge-gconv-modules $i \
      < $PKG_BUILD/iconvdata/gconv-modules \
      >> $INSTALL/usr/lib/gconv/gconv-modules
  done

  # create default configs
  mkdir -p $INSTALL/etc
  touch $INSTALL/etc/gai.conf
  touch $INSTALL/etc/host.conf
}

configure_init() {
  rm -rf $PKG_BUILD_SUBDIR
}

make_init() {
  :
}

makeinstall_init() {
  mkdir -p $INSTALL/lib
  cp -PR $PKG_BUILD/.build_target/elf/ld*.so* $INSTALL/lib
  mkdir -p $INSTALL/usr/lib
  cp $PKG_BUILD/.build_target/libc.so.6 $INSTALL/usr/lib
}
