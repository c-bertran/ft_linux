#!/bin/bash

mkdir file
tar xf file-*.tar.gz -C file  --strip-components=1
cd file
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf file