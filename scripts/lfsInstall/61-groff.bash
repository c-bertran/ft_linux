#!/bin/bash

mkdir groff
tar xvf groff-*.tar.gz -C groff  --strip-components=1
cd groff
PAGE=A4 ./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf groff