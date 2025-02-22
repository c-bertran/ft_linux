#!/bin/bash

tar -xvf diffutils-*.tar.xz -C diffutils
cd diffutils
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(./build-aux/config.guess)
make -j$(nproc)
make DESTDIR=$LFS install
cd ..
rm -rf diffutils
