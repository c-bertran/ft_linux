#!/bin/bash

mkdir zlib
tar xf zlib-*.tar.gz -C zlib  --strip-components=1
cd zlib
./configure --prefix=/usr
make -j$(nproc)
make check
make install
rm -fv /usr/lib/libz.a
cd ..
rm -rf zlib