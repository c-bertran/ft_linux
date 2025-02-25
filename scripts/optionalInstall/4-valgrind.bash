#!/bin/bash

mkdir valgrind
tar xf valgrind-*.tar.bz2 -C valgrind --strip-components=1
cd valgrind

sed -i 's|/doc/valgrind||' docs/Makefile.in &&

./configure --prefix=/usr \
            --datadir=/usr/share/doc/valgrind-3.23.0 &&
make
make install

cd ..
rm -rf valgrind
