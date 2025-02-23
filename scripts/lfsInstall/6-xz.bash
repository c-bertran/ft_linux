#!/bin/bash

tar xvf xz-*.tar.xz --one-top-level=xz
cd xz
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.6.2
make -j$(nproc)
make check
make install
cd ..
rm -rf xz