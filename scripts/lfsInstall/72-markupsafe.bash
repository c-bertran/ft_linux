#!/bin/bash

tar xvf MarkupSafe-*.tar.gz --one-top-level=MarkupSafe
cd MarkupSafe
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --no-user --find-links dist Markupsafe
cd ..
rm -rf MarkupSafe