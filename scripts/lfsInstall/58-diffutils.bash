#!/bin/bash

tar xvf diffutils-*.tar.xz -C diffutils
cd diffutils
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf diffutils