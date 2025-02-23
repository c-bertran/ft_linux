#!/bin/bash

mkdir gawk
tar -xvf gawk-5.*.tar.xz -C gawk  --strip-components=1
cd gawk
sed -i 's/extras//' Makefile.in
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make -j$(nproc)            
make DESTDIR=$LFS install
cd ..
rm -rf gawk
