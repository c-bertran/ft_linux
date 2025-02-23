#!/bin/bash

tar xvf iana-etc-*.tar.gz --one-top-level=iana-etc
cd iana-etc
cp services protocols /etc
cd ..
rm -rf iana-etc
