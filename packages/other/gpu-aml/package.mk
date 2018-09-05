# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="gpu-aml"
PKG_VERSION="fe7a4d8" # r7p0
PKG_SITE="http://openlinux.amlogic.com:8000/download/ARM/gpu/"
PKG_URL="https://github.com/khadas/android_hardware_arm_gpu/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="linux"
PKG_NEED_REBUILD="linux"

pre_configure_target() {
  ln -s $PKG_BUILD/utgard/platform $PKG_BUILD/utgard/r7p0/platform
  sed -e "s|^GIT_REV := .*|GIT_REV := |g" -i $PKG_BUILD/utgard/*/Kbuild
  sed -e "s|shell date|shell date -R|g" -i $PKG_BUILD/utgard/*/Kbuild
  sed -e "s|USING_GPU_UTILIZATION=1|USING_GPU_UTILIZATION=0|g" -i $PKG_BUILD/utgard/platform/Kbuild.amlogic
}

make_target() {
  LDFLAGS="" make -C $(get_pkg_build linux) M=$PKG_BUILD/utgard/r7p0 \
    EXTRA_CFLAGS="-DCONFIG_MALI450=y" \
    CONFIG_MALI400=m CONFIG_MALI450=m
}

makeinstall_target() {
  LDFLAGS="" make -C $(get_pkg_build linux) M=$PKG_BUILD/utgard/r7p0 \
    INSTALL_MOD_PATH=$INSTALL INSTALL_MOD_STRIP=1 DEPMOD=: \
  modules_install
}
