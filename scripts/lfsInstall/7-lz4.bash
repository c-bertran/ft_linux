#!/bin/bash

mkdir lz4
tar xvf lz4-*.tar.gz -C lz4  --strip-components=1
cd lz4
make BUILD_STATIC=no PREFIX=/usr
make -j1 check
make BUILD_STATIC=no PREFIX=/usr install
cd ..
rm -rf lz4