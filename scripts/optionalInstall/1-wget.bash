#!/bin/bash

mkdir wget
tar xf wget2-*.tar.gz -C wget --strip-components=1
cd wget

./configure --prefix=/usr      \
            --sysconfdir=/etc  \
            --with-ssl=openssl
make
make install
ln -sv wget2 /usr/bin/wget

cd ..
rm -rf wget
