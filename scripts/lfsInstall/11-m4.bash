#!/bin/bash

tar xvf m4-*.tar.gz --one-top-level=m4
cd m4
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf m4