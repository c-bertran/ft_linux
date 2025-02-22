#!/bin/bash

tar -xvf Python-*.tar.xz -C python
cd python
./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip
make -j$(nproc)
make install
cd ..
rm -rf perl
