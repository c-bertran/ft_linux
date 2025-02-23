#!/bin/bash

tar xvf gcc-*.tar.xz --one-top-level=gcc
tar -xf ../mpfr-*.tar.xz --one-top-level=mpfr
tar -xf ../gmp-*.tar.xz --one-top-level=gmp
tar -xf ../mpc-*.tar.gz --one-top-level=mpc

cd gcc

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
 ;;
esac

mkdir -v build
cd       build

../configure                  \
    --target=$LFS_TGT         \
    --prefix=$LFS/tools       \
    --with-glibc-version=2.40 \
    --with-sysroot=$LFS       \
    --with-newlib             \
    --without-headers         \
    --enable-default-pie      \
    --enable-default-ssp      \
    --disable-nls             \
    --disable-shared          \
    --disable-multilib        \
    --disable-threads         \
    --disable-libatomic       \
    --disable-libgomp         \
    --disable-libquadmath     \
    --disable-libssp          \
    --disable-libvtv          \
    --disable-libstdcxx       \
    --enable-languages=c,c++

make -j$(nproc)
make install
cd ..

cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
  `dirname \
    $($LFS_TGT-gcc -print-libgcc-file-name)`/include/limits.h

cd ..
rm -rf gcc
