#!/bin/bash

mkdir patch
tar -xvf patch-2.*.tar.xz -C patch  --strip-components=1
cd patch
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make -j$(nproc)
make DESTDIR=$LFS install
cd ..
rm -rf patch
