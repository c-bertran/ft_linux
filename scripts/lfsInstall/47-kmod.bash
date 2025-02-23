#!/bin/bash

mkdir kmod
tar xf kmod-*.tar.xz -C kmod  --strip-components=1
cd kmod
./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --with-openssl    \
            --with-xz         \
            --with-zstd       \
            --with-zlib       \
            --disable-manpages
make -j$(nproc)
make install
for target in depmod insmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /usr/sbin/$target
  rm -fv /usr/bin/$target
done

cd ..
rm -rf kmod