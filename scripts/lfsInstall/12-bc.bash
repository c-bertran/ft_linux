#!/bin/bash

mkdir bc
tar xf bc-*.tar.xz -C bc  --strip-components=1
cd bc
CC=gcc ./configure --prefix=/usr -G -O3 -r
make -j$(nproc)
make test
make install
cd ..
rm -rf bc