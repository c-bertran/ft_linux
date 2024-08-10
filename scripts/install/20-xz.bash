#!/bin/bash

tar -xvf xz-5.4.6.tar.xz -C xz
cd xz
./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.4.6
make -j$(nproc)
make DESTDIR=$LFS install
cd ..
rm -rf xz
