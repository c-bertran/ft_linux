#!/bin/bash

mkdir gettext
tar xf gettext-*.tar.xz -C gettext  --strip-components=1
cd gettext
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.22.5
make
make check
make install
chmod -v 0755 /usr/lib/preloadable_libintl.so
cd ..
rm -rf gettext