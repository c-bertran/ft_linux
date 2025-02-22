#!/bin/bash

tar xvf zlib-*.tar.xz -C zlib
cd zlib
./configure --prefix=/usr
make -j$(nproc)
make check
make install
rm -fv /usr/lib/libz.a
cd ..
rm -rf zlib