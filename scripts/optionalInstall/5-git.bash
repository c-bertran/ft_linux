#!/bin/bash

mkdir git
tar xf git-*.tar.xz -C git --strip-components=1
cd git

./configure --prefix=/usr \
            --with-gitconfig=/etc/gitconfig \
            --with-python=python3
make
tar -xf ../git-manpages-2.46.0.tar.xz \
    -C /usr/share/man --no-same-owner --no-overwrite-dir
mkdir -vp   /usr/share/doc/git-2.46.0 &&
tar   -xf   ../git-htmldocs-2.46.0.tar.xz \
      -C    /usr/share/doc/git-2.46.0 --no-same-owner --no-overwrite-dir &&

find        /usr/share/doc/git-2.46.0 -type d -exec chmod 755 {} \; &&
find        /usr/share/doc/git-2.46.0 -type f -exec chmod 644 {} \;
mkdir -vp /usr/share/doc/git-2.46.0/man-pages/{html,text}         &&
mv        /usr/share/doc/git-2.46.0/{git*.txt,man-pages/text}     &&
mv        /usr/share/doc/git-2.46.0/{git*.,index.,man-pages/}html &&

mkdir -vp /usr/share/doc/git-2.46.0/technical/{html,text}         &&
mv        /usr/share/doc/git-2.46.0/technical/{*.txt,text}        &&
mv        /usr/share/doc/git-2.46.0/technical/{*.,}html           &&

mkdir -vp /usr/share/doc/git-2.46.0/howto/{html,text}             &&
mv        /usr/share/doc/git-2.46.0/howto/{*.txt,text}            &&
mv        /usr/share/doc/git-2.46.0/howto/{*.,}html               &&

sed -i '/^<a href=/s|howto/|&html/|' /usr/share/doc/git-2.46.0/howto-index.html &&
sed -i '/^\* link:/s|howto/|&html/|' /usr/share/doc/git-2.46.0/howto-index.txt

cd ..
rm -rf git