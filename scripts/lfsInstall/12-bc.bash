#!/bin/bash

tar xvf bc-*.tar.xz -C bc
cd bc
CC=gcc ./configure --prefix=/usr -G -O3 -r
make -j$(nproc)
make test
make install
cd ..
rm -rf bc