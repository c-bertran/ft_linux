#!/bin/bash

tar xvf diffutils-*.tar.xz --one-top-level=diffutils
cd diffutils
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf diffutils