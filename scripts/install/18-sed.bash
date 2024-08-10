#!/bin/bash

tar -xvf sed-4.*.tar.xz -C sed
cd sed
./configure --prefix=/usr   \
            --host=$LFS_TGT
make -j$(nproc)
make DESTDIR=$LFS install
cd ..
rm -rf sed
