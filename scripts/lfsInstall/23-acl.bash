#!/bin/bash

tar xvf acl-*.tar.xz -C acl
cd acl
./configure --prefix=/usr         \
            --disable-static      \
            --docdir=/usr/share/doc/acl-2.3.2
make
make install
cd ..
rm -rf acl
