#!/bin/bash

mkdir iproute2
tar xvf iproute2-*.tar.xz -C iproute2  --strip-components=1
cd iproute2
sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8
make NETNS_RUN_DIR=/run/netns
make SBINDIR=/usr/sbin install
mkdir -pv             /usr/share/doc/iproute2-6.10.0
cp -v COPYING README* /usr/share/doc/iproute2-6.10.0
cd ..
rm -rf iproute2