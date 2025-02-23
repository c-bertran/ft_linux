#!/bin/bash

tar -xvf texinfo-*.tar.xz --one-top-level=texinfo
cd texinfo
./configure --prefix=/usr
make -j$(nproc)
make install
cd ..
rm -rf texinfo
