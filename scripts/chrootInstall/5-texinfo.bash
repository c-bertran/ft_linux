#!/bin/bash

tar -xvf texinfo-*.tar.xz -C texinfo
cd texinfo
sed -e 's/__attribute_nonnull__/__nonnull/' \
    -i gnulib/lib/malloc/dynarray-skeleton.c
./configure --prefix=/usr
make -j$(nproc)
make install
cd ..
rm -rf texinfo
