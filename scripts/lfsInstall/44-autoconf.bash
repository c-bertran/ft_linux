#!/bin/bash

tar xvf autoconf-*.tar.xz -C autoconf
cd autoconf
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf autoconf