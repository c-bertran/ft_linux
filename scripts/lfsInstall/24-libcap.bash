#!/bin/bash

mkdir libcap
tar xvf libcap-*.tar.xz -C libcap  --strip-components=1
cd libcap
sed -i '/install -m.*STA/d' libcap/Makefile
make prefix=/usr lib=lib
make test
make prefix=/usr lib=lib install
cd ..
rm -rf libcap