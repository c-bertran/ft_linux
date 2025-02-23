#!/bin/bash

tar xvf libxcrypt-*.tar.xz --one-top-level=libxcrypt
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