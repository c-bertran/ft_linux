#!/bin/bash

tar xvf setuptools-*.tar.gz --one-top-level=setuptools
cd setuptools
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --find-links dist setuptools
cd ..
rm -rf setuptools