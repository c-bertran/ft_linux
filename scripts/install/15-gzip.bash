#!/bin/bash

tar -xvf gzip-1.*.tar.xz --one-top-level=gzip
cd gzip
./configure --prefix=/usr --host=$LFS_TGT
make -j$(nproc)
make DESTDIR=$LFS install
cd ..
rm -rf gzip
