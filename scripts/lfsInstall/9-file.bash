#!/bin/bash

tar xvf file-*.tar.gz -C file
cd file
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf file