#!/bin/bash

mkdir linux
tar -xf linux-*.tar.xz -C linux  --strip-components=1
cd linux
make mrproper
make headers

find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include $LFS/usr

cd ..
rm -rf linux
