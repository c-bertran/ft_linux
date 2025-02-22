#!/bin/bash

tar xvf texinfo-*.tar.xz -C texinfo
cd texinfo
./configure --prefix=/usr
make -j$(nproc)
make install
make TEXMF=/usr/share/texmf install-tex
pushd /usr/share/info
  rm -v dir
  for f in *
    do install-info $f dir 2>/dev/null
  done
popd
cd ..
rm -rf texinfo