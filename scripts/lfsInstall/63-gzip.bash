#!/bin/bash

mkdir gzip
tar xf gzip-*.tar.xz -C gzip  --strip-components=1
cd gzip
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf gzip