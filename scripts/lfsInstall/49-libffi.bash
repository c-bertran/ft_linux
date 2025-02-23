#!/bin/bash

tar xvf libffi-*.tar.gz --one-top-level=libffi
cd libffi
./configure --prefix=/usr          \
            --disable-static       \
            --with-gcc-arch=native
make -j$(nproc)
make check
make install
cd ..
rm -rf libffi