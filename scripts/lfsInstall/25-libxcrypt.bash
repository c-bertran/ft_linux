#!/bin/bash

mkdir libxcrypt
tar xf libxcrypt-*.tar.xz -C libxcrypt  --strip-components=1
cd libxcrypt
./configure --prefix=/usr                \
            --enable-hashes=strong,glibc \
            --enable-obsolete-api=no     \
            --disable-static             \
            --disable-failure-tokens
make
make check
make install
cd ..
rm -rf libxcrypt