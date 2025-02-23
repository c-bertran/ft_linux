#!/bin/bash

mkdir sed
tar -xvf sed-4.*.tar.xz -C sed  --strip-components=1
cd sed
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(./build-aux/config.guess)
make -j$(nproc)
make DESTDIR=$LFS install
cd ..
rm -rf sed
