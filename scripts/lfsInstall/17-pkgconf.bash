#!/bin/bash

mkdir pkgconf
tar xf pkgconf-*.tar.xz -C pkgconf  --strip-components=1
cd pkgconf
./configure --prefix=/usr              \
            --disable-static           \
            --docdir=/usr/share/doc/pkgconf-2.3.0
make
make install
ln -sv pkgconf   /usr/bin/pkg-config
ln -sv pkgconf.1 /usr/share/man/man1/pkg-config.1
cd ..
rm -rf pkgconf