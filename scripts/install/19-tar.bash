#!/bin/bash

mkdir tar
tar xf tar-*.tar.xz -C tar  --strip-components=1
cd tar
./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess)
make -j$(nproc)
make DESTDIR=$LFS install
cd ..
rm -rf tar
