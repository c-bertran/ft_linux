#!/bin/bash

tar xvf less-*.tar.gz -C less
cd less
./configure --prefix=/usr --sysconfdir=/etc
make -j$(nproc)
make check
make install
cd ..
rm -rf less