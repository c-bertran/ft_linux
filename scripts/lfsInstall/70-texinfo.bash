#!/bin/bash

mkdir texinfo
tar xf texinfo-*.tar.xz -C texinfo  --strip-components=1
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