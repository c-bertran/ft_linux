#!/bin/bash

mkdir grep
tar xvf grep-*.tar.xz -C grep  --strip-components=1
cd grep
sed -i "s/echo/#echo/" src/egrep.sh
./configure --prefix=/usr
make
make check
make install
cd ..
rm -rf grep