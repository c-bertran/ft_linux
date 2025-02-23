#!/bin/bash

tar xvf flit_core-*.tar.gz --one-top-level=flit_core
cd flit_core
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --no-user --find-links dist flit_core
cd ..
rm -rf flit_core