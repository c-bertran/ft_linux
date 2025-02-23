#!/bin/bash

mkdir gperf
tar xf gperf-*.tar.gz -C gperf  --strip-components=1
cd gperf
./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1
make -j$(nproc)
make -j1 check
make install
cd ..
rm -rf gperf