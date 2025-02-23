#!/bin/bash

tar xvf file-*.tar.gz --one-top-level=file
cd file
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf file