#!/bin/bash

mkdir libtool
tar xf libtool-*.tar.xz -C libtool  --strip-components=1
cd libtool
./configure --prefix=/usr
make
make -k check
make install
rm -fv /usr/lib/libltdl.a
cd ..
rm -rf libtool