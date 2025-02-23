#!/bin/bash

mkdir mpfr
tar xvf mpfr-*.tar.xz -C mpfr  --strip-components=1
cd mpfr
./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.2.1
make
make html
make check
make install
make install-html
cd ..
rm -rf mpfr