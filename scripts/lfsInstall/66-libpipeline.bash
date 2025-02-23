#!/bin/bash

tar xvf libpipeline-*.tar.gz --one-top-level=libpipeline
cd libpipeline
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf libpipeline