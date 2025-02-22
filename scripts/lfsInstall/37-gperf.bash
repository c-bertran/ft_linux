#!/bin/bash

tar xvf gperf-*.tar.gz -C gperf
cd gperf
./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1
make -j$(nproc)
make -j1 check
make install
cd ..
rm -rf gperf