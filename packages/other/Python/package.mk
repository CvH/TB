################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="Python"
PKG_VERSION="2.7.14"
PKG_SITE="http://www.python.org/"
PKG_URL="http://www.python.org/ftp/python/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="sqlite expat bzip2 libressl Python:host"

PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_HOST="
  ac_cv_prog_HAS_HG=/bin/false
  ac_cv_prog_SVNVERSION=/bin/false
  --enable-static
  --disable-pyo-build
  --disable-pyc-build
  --disable-sqlite3
  --disable-codecs-cjk
  --disable-nis
  --without-cxx-main
  --disable-ssl
  --disable-bz2
  --enable-zlib
  --disable-dbm
  --disable-gdbm
  --disable-bsddb
  --enable-unicodedata
  --disable-tk
  --disable-curses
  --disable-ossaudiodev
  --disable-pydoc
  --disable-test-modules
  --disable-lib2to3
  --disable-ipv6
  --with-expat=builtin
"

PKG_CONFIGURE_OPTS_TARGET="
  ac_cv_have_long_long_format=yes
  ac_cv_file__dev_ptmx=no
  ac_cv_file__dev_ptc=no
  ac_cv_working_tzset=yes
  ac_cv_prog_HAS_HG=/bin/false
  ac_cv_prog_SVNVERSION=/bin/false
  ac_cv_file_dev_ptc=no
  ac_cv_file_dev_ptmx=yes
  ac_cv_func_lchflags_works=no
  ac_cv_func_chflags_works=no
  ac_cv_func_printf_zd=yes
  ac_cv_buggy_getaddrinfo=no
  ac_cv_header_bluetooth_bluetooth_h=no
  ac_cv_header_bluetooth_h=no
  --disable-pyo-build
  --disable-pyc-build
  --enable-static
  --enable-sqlite3
  --disable-codecs-cjk
  --disable-nis
  --enable-ssl
  --enable-bz2
  --enable-zlib
  --disable-dbm
  --disable-gdbm
  --disable-bsddb
  --enable-unicodedata
  --disable-tk
  --disable-curses
  --disable-ossaudiodev
  --disable-pydoc
  --disable-test-modules
  --disable-lib2to3
  --enable-unicode=ucs4
  --without-cxx-main
  --without-doc-strings
  --with-expat=system
  --without-pymalloc
"

post_unpack() {
  # This is needed to make sure the Python build process doesn't try to
  # regenerate those files with the pgen program. Otherwise, it builds
  # pgen for the target, and tries to run it on the host.
  touch $PKG_BUILD/Include/graminit.h
  touch $PKG_BUILD/Python/graminit.c
}

post_makeinstall_target() {
  EXCLUDE_DIR="ensurepip config compiler distutils sysconfigdata unittest"
  for dir in $EXCLUDE_DIR; do
    rm -rf $INSTALL/usr/lib/python2.7/$dir
  done
  rm -rf $INSTALL/usr/lib/python2.7/lib-dynload/sysconfigdata

  rm -f $INSTALL/usr/bin/python*-config
  rm -f $INSTALL/usr/bin/smtpd.py

  rm -f $INSTALL/usr/bin/python
  rm -f $INSTALL/usr/bin/python2
  rm -f $INSTALL/usr/bin/python2.7

  cd $INSTALL/usr/lib/python2.7
  python -Wi -t -B $PKG_BUILD/Lib/compileall.py -d /usr/lib/python2.7 -f .
  find $INSTALL/usr/lib/python2.7 -name "*.py" -exec rm -f {} \; &>/dev/null
}
