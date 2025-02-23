#!/bin/bash

tar -xvf bison-*.tar.xz --one-top-level=bison
cd bison
./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.8.2
make -j$(nproc)
make install
cd ..
rm -rf bison
