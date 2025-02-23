#!/bin/bash

tar xvf wheel-*.tar.gz --one-top-level=wheel
cd wheel
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --find-links=dist wheel
cd ..
rm -rf wheel