#!/bin/bash

tar -xvf xz-5.4.6.tar.xz --one-top-level=xz
cd xz
./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.4.6
make -j$(nproc)
make DESTDIR=$LFS install
rm -v $LFS/usr/lib/liblzma.la
cd ..
rm -rf xz
