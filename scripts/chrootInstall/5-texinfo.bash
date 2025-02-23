#!/bin/bash

mkdir texinfo
tar xf texinfo-*.tar.xz -C texinfo  --strip-components=1
cd texinfo
./configure --prefix=/usr
make -j$(nproc)
make install
cd ..
rm -rf texinfo
