#!/bin/bash

tar xvf patch-*.tar.xz --one-top-level=patch
cd patch
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf patch