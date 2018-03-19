################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="Pillow"
PKG_VERSION="5.0.0"
PKG_SITE="https://github.com/python-pillow/Pillow"
PKG_URL="https://github.com/python-pillow/Pillow/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="Python freetype libjpeg-turbo setuptools:host"

pre_configure_target() {
  export _python_sysroot="$SYSROOT_PREFIX"
  export _python_prefix="/usr"
  export _python_exec_prefix="/usr"
  export LDSHARED="$CC -shared"
}

make_target() {
  python setup.py build_ext --disable-platform-guessing
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
  rm -rf $INSTALL/usr/bin
}
