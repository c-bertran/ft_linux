#!/bin/bash

mkdir setuptools
tar xf setuptools-*.tar.gz -C setuptools  --strip-components=1
cd setuptools
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --find-links dist setuptools
cd ..
rm -rf setuptools