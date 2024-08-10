#!/bin/bash

tar xvf binutils-*.tar.xz -C binutils
cd binutils
mkdir -v build
cd build
../configure --prefix=$LFS/tools \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --enable-gprofng=no \
             --disable-werror    \
             --enable-default-hash-style=gnu
make -j$(nproc)
make install
cd ../..
rm -rf binutils
