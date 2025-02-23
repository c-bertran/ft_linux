#!/bin/bash

mkdir acl
tar xf acl-*.tar.xz -C acl  --strip-components=1
cd acl
./configure --prefix=/usr         \
            --disable-static      \
            --docdir=/usr/share/doc/acl-2.3.2
make
make install
cd ..
rm -rf acl
