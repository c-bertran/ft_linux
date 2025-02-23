#!/bin/bash

mkdir automake
tar xvf automake-*.tar.xz -C automake  --strip-components=1
cd automake
./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.17
make -j$(nproc)
make -j4 check
make install
cd ..
rm -rf automake