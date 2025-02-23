#!/bin/bash

mkdir gzip
tar xf gzip-1.*.tar.xz -C gzip  --strip-components=1
cd gzip
./configure --prefix=/usr --host=$LFS_TGT
make -j$(nproc)
make DESTDIR=$LFS install
cd ..
rm -rf gzip
