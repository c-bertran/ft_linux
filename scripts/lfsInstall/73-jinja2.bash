#!/bin/bash

mkdir Jinja2
tar xf Jinja2-*.tar.gz -C Jinja2  --strip-components=1
cd Jinja2
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --no-user --find-links dist Jinja2
cd ..
rm -rf Jinja2