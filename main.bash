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
sudo find $LFS/sources -mindepth 1 -type d -exec rm -r {} +
sudo rm -rf $LFS/sources/*.bash
sudo cp -r ./scripts/chrootInstall/* $LFS/sources
#sudo chown -R lfs:lfs $LFS/sources/*.bash
sudo LFS=$LFS bash ./scripts/5.bash

sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    MAKEFLAGS="-j$(nproc)"      \
    TESTSUITEFLAGS="-j$(nproc)" \
    /bin/bash --login < ./scripts/6.bash
sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    MAKEFLAGS="-j$(nproc)"      \
    TESTSUITEFLAGS="-j$(nproc)" \
    /bin/bash --login < ./scripts/6.1.bash

echo '>>>>>>' 'LFS install' '<<<<<<'
sudo find $LFS/sources -mindepth 1 -type d -exec rm -rf {} +
sudo rm -rf $LFS/sources/*.bash
sudo cp -r ./scripts/lfsInstall/* $LFS/sources
sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    /bin/bash --login < ./scripts/6.2.bash

echo '>>>>>>' 'Clean dumps' '<<<<<<'
sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    /bin/bash --login < ./scripts/7.bash

echo '>>>>>>' 'System configuration' '<<<<<<'
sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    /bin/bash --login < ./scripts/8.bash
sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    /bin/bash --login < ./scripts/9.bash

echo '>>>>>>' 'Make LFS bootable' '<<<<<<'
sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    /bin/bash --login < ./scripts/10.bash

echo '>>>>>>' 'Customization' '<<<<<<'
sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    /bin/bash --login < ./scripts/11.bash

umount -v $LFS/dev/pts
mountpoint -q $LFS/dev/shm && umount -v $LFS/dev/shm
umount -v $LFS/dev
umount -v $LFS/run
umount -v $LFS/proc
umount -v $LFS/sys
umount -v $LFS

shutdown -r now
