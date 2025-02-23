#!/bin/bash

mkdir XML-Parser
tar xvf XML-Parser-*.tar.gz -C XML-Parser  --strip-components=1
cd XML-Parser
perl Makefile.PL
make -j$(nproc)
make test
make install
cd ..
rm -rf XML-Parser