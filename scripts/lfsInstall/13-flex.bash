#!/bin/bash

tar xvf flex-*.tar.gz --one-top-level=flex
cd flex
./configure --prefix=/usr \
            --docdir=/usr/share/doc/flex-2.6.4 \
            --disable-static
make -j$(nproc)
make check
make install
ln -sv flex   /usr/bin/lex
ln -sv flex.1 /usr/share/man/man1/lex.1
cd ..
rm -rf flex