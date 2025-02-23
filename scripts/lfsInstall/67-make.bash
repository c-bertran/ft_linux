#!/bin/bash

tar xvf make-*.tar.gz --one-top-level=make
cd make
./configure --prefix=/usr
make -j$(nproc)
make install
cd ..
rm -rf make