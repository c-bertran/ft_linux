#!/bin/bash

tar -xvf m4-1.4.*.tar.xz --one-top-level=m4
cd m4
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make -j$(nproc)
make DESTDIR=$LFS install
cd ..
rm -rf m4
