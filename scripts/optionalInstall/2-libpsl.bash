#!/bin/bash

mkdir -v libunistring libidn libpsl

tar xf libunistring-*.tar.xz -C valgrind --strip-components=1
tar xf libidn-*.tar.gz -C valgrind --strip-components=1
tar xf libpsl-*.tar.gz -C valgrind --strip-components=1

cd libunistring
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/libunistring-1.2
make
make install

cd ../libidn
./configure --prefix=/usr --disable-static
make
make install

cd ../libpsl
mkdir build
cd    build
meson setup --prefix=/usr --buildtype=release && ninja

cd ../..
rm -rf libunistring libidn libpsl
