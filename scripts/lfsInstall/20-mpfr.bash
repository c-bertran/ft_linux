#!/bin/bash

tar xvf mpfr-*.tar.xz --one-top-level=mpfr
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