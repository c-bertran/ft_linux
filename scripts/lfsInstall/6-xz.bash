#!/bin/bash

mkdir xz
tar xvf xz-*.tar.xz -C xz  --strip-components=1
cd xz
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.6.2
make -j$(nproc)
make check
make install
cd ..
rm -rf xz