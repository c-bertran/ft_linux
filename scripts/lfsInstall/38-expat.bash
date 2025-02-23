#!/bin/bash

mkdir expat
tar xvf expat-*.tar.xz -C expat  --strip-components=1
cd expat
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.6.2
make -j$(nproc)
make check
make install
install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.6.2
cd ..
rm -rf expat