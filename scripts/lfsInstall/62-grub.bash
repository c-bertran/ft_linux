#!/bin/bash

tar xvf grub-*.tar.xz --one-top-level=grub
cd grub
unset {C,CPP,CXX,LD}FLAGS
echo depends bli part_gpt > grub-core/extra_deps.lst
./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror
make -j$(nproc)
make install
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions
cd ..
rm -rf grub