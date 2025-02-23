#!/bin/bash

mkdir diffutils
tar xf diffutils-*.tar.xz -C diffutils  --strip-components=1
cd diffutils
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(./build-aux/config.guess)
make -j$(nproc)
make DESTDIR=$LFS install
cd ..
rm -rf diffutils
