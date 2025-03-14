#!/bin/bash

mkdir bison
tar xf bison-*.tar.xz -C bison  --strip-components=1
cd bison
./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.8.2
make -j$(nproc)
make check
make install
cd ..
rm -rf bison