#!/bin/bash

tar -xvf gzip-1.*.tar.xz -C gzip
cd gzip
./configure --prefix=/usr --host=$LFS_TGT
make -j$(nproc)
make DESTDIR=$LFS install
cd ..
rm -rf gzip
