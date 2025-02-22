#!/bin/bash

tar -xvf gettext-*.tar.xz -C gettext
cd gettext
./configure --disable-shared
make -j$(nproc)
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin
cd ..
rm -rf gettext