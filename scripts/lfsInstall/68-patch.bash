#!/bin/bash

tar xvf patch-*.tar.xz -C patch
cd patch
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf patch