#!/bin/bash

export LFS=/mnt/lfs
echo '>>>>>>' 'Init' '<<<<<<'
sudo -i bash < ./scripts/1.bash
echo '>>>>>>' 'LFS edition' '<<<<<<'
echo If needed, for lfs password is lfs
sudo -i -u lfs bash < ./scripts/2.bash
#echo '>>>>>>' 'ROOT edition' '<<<<<<'
#sudo -i bash < ./scripts/3.bash
#sudo -i bash < ./scripts/4.bashln -s /usr/bin/bash /bin/sh
#sudo -i bash << EOF
#chmod 755 /etc/sudoers
#echo "lfs      ALL=(ALL:ALL) ALL" >> /etc/sudoers
#EOF
echo '>>>>>>' 'Dependencies installation' '<<<<<<'
sudo cp -r ./scripts/install/* $LFS/sources
sudo chown -R lfs:lfs $LFS/sources/*.bash
sudo -u lfs << EOF
cd $LFS/sources
./main.bash
EOF

echo '>>>>>>' 'Tools' '<<<<<<'
sudo find /path/to/specified/dir -mindepth 1 -type d -exec rm -r {} +
sudo cp -r ./scripts/chrootInstall/* $LFS/sources
sudo chown -R lfs:lfs $LFS/sources/*.bash
sudo LFS=$LFS bash ./scripts/5.bash

sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    MAKEFLAGS="-j$(nproc)"      \
    TESTSUITEFLAGS="-j$(nproc)" \
    /bin/bash --login < ./scripts/6.bash

echo '>>>>>>' 'Kernel' '<<<<<<'
sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    /bin/bash --login < ./scripts/7.bash

echo '>>>>>>' 'Bootloader' '<<<<<<'
sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    /bin/bash --login < ./scripts/8.bash
