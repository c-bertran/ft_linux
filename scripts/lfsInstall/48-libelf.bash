#!/bin/bash

tar xvf elfutils-*.tar.bz2 --one-top-level=elfutils
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