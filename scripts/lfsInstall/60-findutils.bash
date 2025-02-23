#!/bin/bash

mkdir findutils
tar xf findutils-*.tar.xz -C findutils  --strip-components=1
cd findutils
./configure --prefix=/usr --localstatedir=/var/lib/locate
make -j$(nproc)
chown -R tester .
su tester -c "PATH=$PATH make check"
make install
cd ..
rm -rf findutils