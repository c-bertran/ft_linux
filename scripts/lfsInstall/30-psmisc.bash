#!/bin/bash

mkdir psmisc
tar xvf psmisc-*.tar.xz -C psmisc  --strip-components=1
cd psmisc
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf psmisc