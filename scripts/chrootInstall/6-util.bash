#!/bin/bash

tar -xvf util-linux-22.39.3.tar.xz -C utilLinux
cd utilLinux
mkdir -pv /var/lib/hwclock
./configure ADJTIME_PATH=/var/lib/hwclock/adjtime    \
            --libdir=/usr/lib    \
            --docdir=/usr/share/doc/util-linux-2.39.3 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python     \
            runstatedir=/run
make -j$(nproc)
make install
cd ..
rm -rf utilLinux
