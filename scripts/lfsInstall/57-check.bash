#!/bin/bash

mkdir check
tar xvf check-*.tar.gz -C check  --strip-components=1
cd check
./configure --prefix=/usr --disable-static
make -j$(nproc)
make check
make docdir=/usr/share/doc/check-0.15.2 install
cd ..
rm -rf check