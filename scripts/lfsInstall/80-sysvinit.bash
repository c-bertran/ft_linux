#!/bin/bash

mkdir sysvinit
tar xf sysvinit-*.tar.xz -C sysvinit  --strip-components=1
cd sysvinit
patch -Np1 -i ../sysvinit-3.10-consolidated-1.patch
make -j$(nproc)
make install
cd ..
rm -rf sysvinit