#!/bin/bash

mkdir man-db
tar xf man-db-*.tar.xz -C man-db  --strip-components=1
cd man-db
./configure --prefix=/usr                         \
            --docdir=/usr/share/doc/man-db-2.12.1 \
            --sysconfdir=/etc                     \
            --disable-setuid                      \
            --enable-cache-owner=bin              \
            --with-browser=/usr/bin/lynx          \
            --with-vgrind=/usr/bin/vgrind         \
            --with-grap=/usr/bin/grap             \
            --with-systemdtmpfilesdir=            \
            --with-systemdsystemunitdir=
make -j$(nproc)
make install
cd ..
rm -rf man-db