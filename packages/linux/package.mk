# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="linux"
PKG_VERSION="2f95f60"
PKG_SITE="http://www.kernel.org"
PKG_URL="https://github.com/LibreELEC/linux-amlogic/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain $KERNEL_EXTRA_DEPENDS"
PKG_NEED_REBUILD="busybox"

post_unpack() {
  cp $PROJECT_DIR/packages/linux/linux.$TARGET_ARCH.conf $PKG_BUILD/.config
  cp $PKG_DIR/config/defkeymap.c $PKG_BUILD/drivers/tty/vt/defkeymap.c_shipped

  sed -e "s|^ARCH[[:space:]]*?=.*$|ARCH = $TARGET_KERNEL_ARCH|" \
      -e "s|^CROSS_COMPILE[[:space:]]*?=.*$|CROSS_COMPILE = ${TARGET_NAME}-|" \
      -i $PKG_BUILD/Makefile
}

make_host() {
  :
}

makeinstall_host() {
  make INSTALL_HDR_PATH=$SYSROOT_PREFIX/usr headers_install
}

pre_configure_target() {
  make -C $PKG_BUILD oldconfig
  export KBUILD_BUILD_USER="-,-'<"
  export KBUILD_BUILD_HOST=","
}

make_target() {
  ( cd $ROOT
    rm -rf $BUILD/image/init
    scripts/install initramfs
  )
  make LDFLAGS="" $KERNEL_TARGET $KERNEL_EXTRA_TARGET modules
}

makeinstall_target() {
  make INSTALL_MOD_PATH=$INSTALL INSTALL_MOD_STRIP=1 modules_install

  DTB_BLOBS=$(ls arch/$TARGET_KERNEL_ARCH/boot/dts/amlogic/*.dtb 2>/dev/null || :)
  DTB_BLOB_OUTPUT="arch/$TARGET_KERNEL_ARCH/boot/dtb.img"
  KERNEL_BOOTIMG_SECOND="--second $DTB_BLOB_OUTPUT"

  $TOOLCHAIN/bin/dtbTool -o $DTB_BLOB_OUTPUT -p scripts/dtc/ arch/$TARGET_KERNEL_ARCH/boot/dts/amlogic/

  mkbootimg --kernel arch/$TARGET_KERNEL_ARCH/boot/$KERNEL_TARGET \
            --output arch/$TARGET_KERNEL_ARCH/boot/$KERNEL_TARGET \
            --ramdisk $BUILD/image/init.cpio \
            $KERNEL_BOOTIMG_SECOND $KERNEL_BOOTIMG_OPTIONS
}

post_makeinstall_target() {
  rm -f $INSTALL/lib/modules/*/build
  rm -f $INSTALL/lib/modules/*/source
}
