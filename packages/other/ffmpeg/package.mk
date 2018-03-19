################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="ffmpeg"
PKG_VERSION="4.0"
PKG_SITE="https://ffmpeg.org"
PKG_URL="http://ffmpeg.org/releases/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="bzip2 libressl"

CONFIGURE_OPTS_TARGET="
  --disable-shared --enable-static --enable-pic
  --prefix=/usr
  --arch=$TARGET_ARCH
  --cpu=$TARGET_CPU
  --cross-prefix=${TARGET_NAME}-
  --enable-cross-compile
  --sysroot=$SYSROOT_PREFIX
  --sysinclude=$SYSROOT_PREFIX/usr/include
  --target-os=linux
  --pkg-config=/usr/bin/pkg-config
  --disable-logging
  --enable-gpl
  --enable-nonfree
  --disable-runtime-cpudetect
  --disable-programs
  --disable-doc
  --disable-avdevice
  --disable-vaapi
  --disable-vdpau
  --disable-encoders
  --enable-encoder=aac,ac3,mjpeg,png
  --disable-muxers
  --enable-muxer=adts,spdif
  --disable-indevs
  --disable-outdevs
  --disable-devices
  --disable-alsa
  --disable-iconv
  --disable-openssl
  --enable-libtls
  --disable-sdl2
  --disable-xlib
  --disable-symver
  --disable-altivec
  --disable-debug
  --disable-extra-warnings
"
