#!/bin/bash

tar xvf libtool-*.tar.xz -C libtool
cd libtool
./configure --prefix=/usr
make
make -k check
make install
rm -fv /usr/lib/libltdl.a
cd ..
rm -rf libtool