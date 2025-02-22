#!/bin/bash

tar xvf zstd-*.tar.gz -C zstd
cd zstd
make check
make prefix=/usr install
rm -v /usr/lib/libzstd.a
cd ..
rm -rf zstd