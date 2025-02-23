#!/bin/bash

mkdir attr
tar xvf attr-*.tar.gz -C attr  --strip-components=1
cd attr
./configure --prefix=/usr     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.5.2
make
make check
make install
cd ..
rm -rf attr