################################################################################
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
################################################################################

PKG_NAME="curl"
PKG_VERSION="7.59.0"
PKG_SITE="http://curl.haxx.se"
PKG_URL="http://curl.haxx.se/download/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="libressl"

PKG_CONFIGURE_OPTS_TARGET="
  ac_cv_path_PERL=
  --disable-shared --enable-static
  --disable-debug
  --enable-optimize
  --disable-curldebug
  --disable-ares
  --enable-symbol-hiding
  --enable-http
  --disable-ftp
  --disable-file
  --disable-ldap
  --disable-ldaps
  --disable-rtsp
  --enable-proxy
  --disable-dict
  --disable-telnet
  --disable-tftp
  --disable-pop3
  --disable-imap
  --disable-smb
  --disable-smtp
  --disable-gopher
  --disable-manual
  --disable-libcurl-option
  --enable-ipv6
  --disable-versioned-symbols
  --enable-threaded-resolver
  --disable-verbose
  --disable-sspi
  --enable-crypto-auth
  --disable-ntlm-wb
  --enable-cookies
  --with-zlib
  --without-gssapi
  --without-egd-socket
  --with-random=/dev/urandom
  --without-gnutls
  --with-ssl
  --without-polarssl
  --without-mbedtls
  --without-cyassl
  --without-nss
  --without-axtls
  --with-ca-bundle=/etc/ssl/cert.pem
  --without-ca-path
  --without-libpsl
  --without-libmetalink
  --without-libssh2
  --without-librtmp
  --without-libidn2
  --without-nghttp2
  --without-zsh-functions-dir
"

pre_configure_target() {
  export CFLAGS="$CLFAGS -lpthread"
}

post_unpack() {
  rm -f $PKG_BUILD/CMakeLists.txt
}

post_makeinstall_target() {
  rm -rf $SYSROOT_PREFIX/usr/bin/curl-config
  rm -rf $INSTALL/usr/bin
}
