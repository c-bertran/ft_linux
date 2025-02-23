#!/bin/bash

mkdir python
tar -xvf Python-*.tar.xz -C python  --strip-components=1
cd python
./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip
make -j$(nproc)
make install
cd ..
rm -rf perl
