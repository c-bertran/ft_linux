#!/bin/bash

mkdir libffi
tar xvf libffi-*.tar.gz -C libffi  --strip-components=1
cd libffi
./configure --prefix=/usr          \
            --disable-static       \
            --with-gcc-arch=native
make -j$(nproc)
make check
make install
cd ..
rm -rf libffi