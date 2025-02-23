#!/bin/bash

tar -xvf patch-2.*.tar.xz --one-top-level=patch
cd patch
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make -j$(nproc)
make DESTDIR=$LFS install
cd ..
rm -rf patch
