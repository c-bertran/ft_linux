#!/bin/bash

export LFS=/mnt/lfs
echo '>>>>>>' 'Init' '<<<<<<'
sudo -i bash < ./scripts/first.bash
echo '>>>>>>' 'LFS edition' '<<<<<<'
echo If needed, password is toor
sudo -i -u lfs bash < ./scripts/lfs.bash
echo '>>>>>>' 'ROOT edition' '<<<<<<'
sudo -i bash < ./scripts/root.bash
sudo -i bash < ./scripts/check.bash
sudo -i bash << EOF
chmod 755 /etc/sudoers
echo "lfs      ALL=(ALL:ALL) ALL" >> /etc/sudoers
EOF
echo '>>>>>>' 'Dependencies installation' '<<<<<<'
sudo -u lfs bash ./scripts/install/main.bash

echo '>>>>>>' 'Tools' '<<<<<<'
sudo -i bash < ./scripts/tools.bash
sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    /bin/bash --login < ./scripts/chroot.bash
