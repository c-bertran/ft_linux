#!/bin/bash

mkdir patch
tar xf patch-*.tar.xz -C patch  --strip-components=1
cd patch
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf patch