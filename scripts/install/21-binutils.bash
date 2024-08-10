#!/bin/bash

tar -xvf binutils-2.*.tar.xz -C binutils
cd binutils
sed '6009s/$add_dir//' -i ltmain.sh
mkdir -v build
cd       build
../configure                   \
    --prefix=/usr              \
    --build=$(../config.guess) \
    --host=$LFS_TGT            \
    --disable-nls              \
    --enable-shared            \
    --disable-werror           \
    --enable-64-bit-bfd
make -j$(nproc)
make DESTDIR=$LFS install
cd ../..
rm -rf binutils