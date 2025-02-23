#!/bin/bash

mkdir make
tar xvf make-*.tar.gz -C make  --strip-components=1
cd make
./configure --prefix=/usr
make -j$(nproc)
make install
cd ..
rm -rf make