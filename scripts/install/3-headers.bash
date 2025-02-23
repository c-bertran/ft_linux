#!/bin/bash

tar -xf linux-5.16.9.tar.xz --one-top-level=linux
cd linux
make mrproper
make headers

find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include $LFS/usr

cd ..
rm -rf linux
