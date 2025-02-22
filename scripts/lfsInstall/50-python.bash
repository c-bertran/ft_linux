#!/bin/bash

tar xvf Python-*.tar.xz -C Python
cd Python
./configure --prefix=/usr        \
            --enable-shared      \
            --with-system-expat  \
            --enable-optimizations
make -j$(nproc)
make install
cat > /etc/pip.conf << EOF
[global]
root-user-action = ignore
disable-pip-version-check = true
EOF

install -v -dm755 /usr/share/doc/python-3.12.5/html

tar --no-same-owner -xvf ../python-3.12.5-docs-html.tar.bz2
cp -R --no-preserve=mode python-3.12.5-docs-html/* /usr/share/doc/python-3.12.5/html

cd ..
rm -rf Python