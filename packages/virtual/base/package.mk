################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="base"
PKG_DEPENDS_TARGET="
  toolchain glibc linux busybox nano netbase dropbear tz
  $ADDITIONAL_PACKAGES
"
