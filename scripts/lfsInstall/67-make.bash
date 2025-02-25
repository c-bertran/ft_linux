#!/bin/bash

mkdir make
tar xf make-*.tar.gz -C make  --strip-components=1
cd make
./configure --prefix=/usr
make -j$(nproc)
chown -R tester .
su tester -c "PATH=$PATH make check"
make install
cd ..
rm -rf make