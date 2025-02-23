#!/bin/bash

mkdir wheel
tar xf wheel-*.tar.gz -C wheel  --strip-components=1
cd wheel
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --find-links=dist wheel
cd ..
rm -rf wheel