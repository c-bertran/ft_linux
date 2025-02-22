#!/bin/bash

tar -xvf tar-*.tar.xz -C tar
cd tar
./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess)
make -j$(nproc)
make DESTDIR=$LFS install
cd ..
rm -rf tar
