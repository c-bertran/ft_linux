#!/bin/bash

mkdir make
tar xf make-4.*.tar.gz -C make  --strip-components=1
cd make
./configure --prefix=/usr   \
            --without-guile \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make -j$(nproc)
make DESTDIR=$LFS install
cd ..
rm -rf make
