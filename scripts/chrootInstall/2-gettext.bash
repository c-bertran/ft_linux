#!/bin/bash

mkdir gettext
tar -xvf gettext-*.tar.xz -C gettext  --strip-components=1
cd gettext
./configure --disable-shared
make -j$(nproc)
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin
cd ..
rm -rf gettext