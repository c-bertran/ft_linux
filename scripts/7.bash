#!/bin/bash

tar -xvf linux-*.tar.xz -C linux
cd linux
make mrproper
make menuconfig
make -j$(nproc)
make modules_install
cp -v arch/x86/boot/bzImage /boot/vmlinuz-$(make kernelrelease)
cp -v System.map /boot/System.map-$(make kernelrelease)
cp -v .config /boot/config-$(make kernelrelease)
cd ..
rm -rf linux
