#!/bin/bash

mkdir less
tar xvf less-*.tar.gz -C less  --strip-components=1
cd less
./configure --prefix=/usr --sysconfdir=/etc
make -j$(nproc)
make check
make install
cd ..
rm -rf less