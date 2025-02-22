#!/bin/bash

tar xvf libffi-*.tar.gz -C libffi
cd libffi
./configure --prefix=/usr          \
            --disable-static       \
            --with-gcc-arch=native
make -j$(nproc)
make check
make install
cd ..
rm -rf libffi