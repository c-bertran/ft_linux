#!/bin/bash

mkdir m4
tar -xvf m4-1.4.*.tar.xz -C m4  --strip-components=1
cd m4
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make -j$(nproc)
make DESTDIR=$LFS install
cd ..
rm -rf m4
