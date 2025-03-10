#!/bin/bash

mkdir coreutils
tar xf coreutils-*.tar.xz -C coreutils  --strip-components=1
cd coreutils
patch -Np1 -i ../coreutils-9.5-i18n-2.patch
autoreconf -fiv
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime

make -j$(nproc)
make install
mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8

cd ..
rm -rf coreutils