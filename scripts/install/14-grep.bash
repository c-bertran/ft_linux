#!/bin/bash

tar -xvf grep-*.tar.xz --one-top-level=grep
cd grep-3.7
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(./build-aux/config.guess)
make -j$(nproc)            
make DESTDIR=$LFS install
cd ..
rm -rf grep
