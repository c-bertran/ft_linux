#!/bin/bash

rm -v man3/crypt*
mkdir man-pages
tar xf man-pages-*.tar.xz -C man-pages  --strip-components=1
cd man-pages
make prefix=/usr install
cd ..
rm -rf man-pages
