#!/bin/bash

mkdir glibc
tar xf glibc-*.tar.xz -C glibc  --strip-components=1
cd glibc

case $(uname -m) in
    i?86)   ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3
    ;;
    x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
            ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
    ;;
esac
patch -Np1 -i ../glibc-2.40-fhs-1.patch
mkdir -v build
cd build
echo "rootsbindir=/usr/sbin" > configparms
../configure                             \
      --prefix=/usr                      \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=4.19               \
      --with-headers=$LFS/usr/include    \
      --disable-nscd                     \
      libc_cv_slibdir=/usr/lib
make -j1
make DESTDIR=$LFS install
sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd
echo 'int main(){}' > dummy.c
$LFS_TGT-gcc dummy.c
if [ $? == 127 ]
then
    echo "gcc: error: cannot find the start of the dynamic linker"
    echo "gcc: error: cannot find the start of the dynamic linker" >&2
    exit 1
fi
readelf -l a.out | grep ld-linux
rm -v dummy.c a.out

cd ../..
rm -rf glibc
