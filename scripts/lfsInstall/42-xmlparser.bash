#!/bin/bash

tar xvf XML-Parser-*.tar.gz -C XML-Parser
cd XML-Parser
perl Makefile.PL
make -j$(nproc)
make test
make install
cd ..
rm -rf XML-Parser