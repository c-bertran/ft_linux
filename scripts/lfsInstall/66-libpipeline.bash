#!/bin/bash

mkdir libpipeline
tar xvf libpipeline-*.tar.gz -C libpipeline  --strip-components=1
cd libpipeline
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf libpipeline