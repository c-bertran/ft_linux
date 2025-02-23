#!/bin/bash

tar xvf gettext-*.tar.xz --one-top-level=gettext
cd gettext
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.22.5
make
make check
make install
chmod -v 0755 /usr/lib/preloadable_libintl.s
cd ..
rm -rf gettext