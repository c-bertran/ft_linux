#!/bin/bash

tar xvf libcap-*.tar.xz --one-top-level=libcap
cd libcap
sed -i '/install -m.*STA/d' libcap/Makefile
make prefix=/usr lib=lib
make test
make prefix=/usr lib=lib install
cd ..
rm -rf libcap