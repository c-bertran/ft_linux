#!/bin/bash

mkdir zstd
tar xf zstd-*.tar.gz -C zstd  --strip-components=1
cd zstd
make check
make prefix=/usr install
rm -v /usr/lib/libzstd.a
cd ..
rm -rf zstd