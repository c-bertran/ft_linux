#!/bin/bash

mkdir autoconf
tar xf autoconf-*.tar.xz -C autoconf  --strip-components=1
cd autoconf
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf autoconf