#!/bin/bash

mkdir gdbm
tar xf gdbm-*.tar.gz -C gdbm  --strip-components=1
cd gdbm
./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat
make -j$(nproc)
make check
make install
cd ..
rm -rf gdbm