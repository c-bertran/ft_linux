#!/bin/bash

tar -xvf make-4.*.tar.gz --one-top-level=make
cd make
./configure --prefix=/usr   \
            --without-guile \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make -j$(nproc)
make DESTDIR=$LFS install
cd ..
rm -rf make
