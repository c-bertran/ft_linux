#!/bin/bash

mkdir inetutils
tar xvf inetutils-*.tar.xz -C inetutils  --strip-components=1
cd inetutils
sed -i 's/def HAVE_TERMCAP_TGETENT/ 1/' telnet/telnet.c
./configure --prefix=/usr        \
            --bindir=/usr/bin    \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers
make -j$(nproc)
make check
make install
mv -v /usr/{,s}bin/ifconfig
cd ..
rm -rf inetutils