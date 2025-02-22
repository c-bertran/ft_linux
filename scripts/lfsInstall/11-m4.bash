#!/bin/bash

mkdir m4
tar xvf m4-*.tar.gz -C m4  --strip-components=1
cd m4
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf m4