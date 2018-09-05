# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="aml-dtbtools"
PKG_VERSION="b2ca13ce06"
PKG_SITE="https://github.com/Wilhansen/aml-dtbtools"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"

PKG_MAKE_OPTS_HOST="dtbTool"

makeinstall_host() {
  mkdir -p $TOOLCHAIN/bin
  cp dtbTool $TOOLCHAIN/bin
}
