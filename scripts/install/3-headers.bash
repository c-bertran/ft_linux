#!/bin/bash

tar -xf linux-5.16.9.tar.xz -C linux
cd linux
make mrproper
make headers

find usr/include -name '.*' -delete
rm usr/include/Makefile
cp -rv usr/include $LFS/usr

cd ..
rm -rf linux
