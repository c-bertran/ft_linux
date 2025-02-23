#!/bin/bash

mkdir bash
tar xf bash-*.tar.gz -C bash  --strip-components=1
cd bash
./configure --prefix=/usr             \
            --without-bash-malloc     \
            --with-installed-readline \
            bash_cv_strtold_broken=no \
            --docdir=/usr/share/doc/bash-5.2.32
make
make install
make install
cd ..
rm -rf bash

exec /usr/bin/bash --login
