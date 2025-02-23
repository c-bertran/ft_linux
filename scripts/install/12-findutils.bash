#!/bin/bash

mkdir findutils
tar -xvf findutils-4.*.tar.xz -C findutils  --strip-components=1
cd findutils
./configure --prefix=/usr                   \
            --localstatedir=/var/lib/locate \
            --host=$LFS_TGT                 \
            --build=$(build-aux/config.guess)
make -j$(nproc)
make DESTDIR=$LFS install
cd ..
rm -rf findutils
