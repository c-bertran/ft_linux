#!/bin/bash

tar xvf less-*.tar.gz --one-top-level=less
cd less
./configure --prefix=/usr --sysconfdir=/etc
make -j$(nproc)
make check
make install
cd ..
rm -rf less