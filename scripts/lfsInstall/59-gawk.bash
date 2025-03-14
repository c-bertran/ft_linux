#!/bin/bash

mkdir gawk
tar xf gawk-*.tar.xz -C gawk  --strip-components=1
cd gawk
sed -i 's/extras//' Makefile.in
./configure --prefix=/usr
make -j$(nproc)
chown -R tester .
su tester -c "PATH=$PATH make check"
rm -f /usr/bin/gawk-5.3.0
make install
ln -sv gawk.1 /usr/share/man/man1/awk.1
mkdir -pv                                   /usr/share/doc/gawk-5.3.0
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.3.0
cd ..
rm -rf gawk