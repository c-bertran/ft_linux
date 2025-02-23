#!/bin/bash

rm -v man3/crypt*
tar xvf man-pages-*.tar.xz --one-top-level=man-pages
cd man-pages
make prefix=/usr install
cd ..
rm -rf man-pages
