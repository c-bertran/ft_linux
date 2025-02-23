#!/bin/bash

tar xvf automake-*.tar.xz --one-top-level=automake
cd automake
./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.17
make -j$(nproc)
make -j4 check
make install
cd ..
rm -rf automake