#!/bin/bash

mkdir xz
tar xf xz-*.tar.xz -C xz  --strip-components=1
cd xz
./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.6.2
make -j$(nproc)
make DESTDIR=$LFS install
rm -v $LFS/usr/lib/liblzma.la
cd ..
rm -rf xz
