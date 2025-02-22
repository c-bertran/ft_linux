#!/bin/bash

tar xvf gzip-*.tar.xz -C gzip
cd gzip
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf gzip