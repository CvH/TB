################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="setuptools"
PKG_VERSION="38.2.5"
PKG_SITE="https://github.com/pypa/setuptools"
PKG_URL="https://github.com/pypa/setuptools/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="Python:host"

make_host() {
  :
}

makeinstall_host() {
  python bootstrap.py
  python setup.py install --prefix=$TOOLCHAIN
}
