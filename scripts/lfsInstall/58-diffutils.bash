#!/bin/bash

mkdir diffutils
tar xvf diffutils-*.tar.xz -C diffutils  --strip-components=1
cd diffutils
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf diffutils