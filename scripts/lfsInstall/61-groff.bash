#!/bin/bash

tar xvf groff-*.tar.gz -C groff
cd groff
PAGE=A4 ./configure --prefix=/usr
make -j$(nproc)
make check
make install
cd ..
rm -rf groff