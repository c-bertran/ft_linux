#!/bin/bash

mkdir elfutils
tar xf elfutils-*.tar.bz2 -C elfutils  --strip-components=1
cd elfutils
./configure --prefix=/usr                \
            --disable-debuginfod         \
            --enable-libdebuginfod=dummy
make -j$(nproc)
make check
make -C libelf install
install -vm644 config/libelf.pc /usr/lib/pkgconfig
rm /usr/lib/libelf.a
cd ..
rm -rf elfutils