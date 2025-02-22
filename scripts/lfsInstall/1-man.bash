#!/bin/bash

rm -v man3/crypt*
tar xvf man-pages-*.tar.xz -C man-pages
cd man-pages
make prefix=/usr install
cd ..
rm -rf man-pages
