#!/bin/bash

mkdir kbd
tar xvf kbd-*.tar.xz -C kbd  --strip-components=1
cd kbd
patch -Np1 -i ../kbd-2.6.4-backspace-1.patch
sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
./configure --prefix=/usr --disable-vlock
make -j$(nproc)
make install
cp -R -v docs/doc -T /usr/share/doc/kbd-2.6.4
cd ..
rm -rf kbd