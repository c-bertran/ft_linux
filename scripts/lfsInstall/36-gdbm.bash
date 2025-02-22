#!/bin/bash

tar xvf gdbm-*.tar.gz -C gdbm
cd gdbm
./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat
make -j$(nproc)
make check
make install
cd ..
rm -rf gdbm