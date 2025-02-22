#!/bin/bash

tar xvf intltool-*.tar.gz -C intltool
cd intltool
sed -i 's:\\\${:\\\$\\{:' intltool-update.in
./configure --prefix=/usr
make -j$(nproc)
make check
make install
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO
cd ..
rm -rf intltool
