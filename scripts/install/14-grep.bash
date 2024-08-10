#!/bin/bash

tar -xvf grep-*.tar.xz -C grep
cd grep-3.7
./configure --prefix=/usr   \
            --host=$LFS_TGT
make -j$(nproc)            
make DESTDIR=$LFS install
cd ..
rm -rf grep
