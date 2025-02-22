#!/bin/bash

tar xvf sysvinit-*.tar.xz -C sysvinit
cd sysvinit
patch -Np1 -i ../sysvinit-3.10-consolidated-1.patch
make -j$(nproc)
make install
cd ..
rm -rf sysvinit