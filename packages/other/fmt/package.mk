# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="fmt"
PKG_VERSION="5.3.0"
PKG_SITE="https://github.com/fmtlib/fmt"
PKG_WATCH="https://github.com/fmtlib/fmt/releases/ .*/archive/([\d\.]*)\.tar\.gz"
PKG_URL="https://github.com/fmtlib/fmt/archive/$PKG_VERSION.tar.gz"

PKG_CMAKE_OPTS_TARGET="
  -DFMT_DOC=OFF
  -DFMT_TEST=OFF
"
