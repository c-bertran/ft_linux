#!/bin/bash

mkdir tar
tar xf tar-*.tar.xz -C tar  --strip-components=1
cd tar
FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr
make -j$(nproc)
make install
make -C doc install-html docdir=/usr/share/doc/tar-1.35
cd ..
rm -rf tar