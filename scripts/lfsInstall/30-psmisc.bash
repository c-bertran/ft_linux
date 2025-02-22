#!/bin/bash

tar xvf psmisc-*.tar.xz -C psmisc
cd psmisc
./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf psmisc