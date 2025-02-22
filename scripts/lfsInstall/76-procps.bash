#!/bin/bash

tar xvf procps-ng-*.tar.xz -C procps-ng
cd procps-ng
./configure --prefix=/usr                           \
            --docdir=/usr/share/doc/procps-ng-4.0.4 \
            --disable-static                        \
            --disable-kill
make -j$(nproc)
make install
cd ..
rm -rf procps-ng