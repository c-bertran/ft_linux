#!/bin/bash

tar xvf mpc-*.tar.xz --one-top-level=mpc
cd mpc
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.3.1
make
make html
make check
make install
make install-html
cd ..
rm -rf mpc