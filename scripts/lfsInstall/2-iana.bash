#!/bin/bash

mkdir iana-etc
tar xvf iana-etc-*.tar.gz -C iana-etc  --strip-components=1
cd iana-etc
cp services protocols /etc
cd ..
rm -rf iana-etc
