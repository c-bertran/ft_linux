#!/bin/bash

mkdir groff
tar xf groff-*.tar.gz -C groff  --strip-components=1
cd groff
PAGE=A4 ./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf groff