#/bin/bash

export LFS=/mnt/lfs
echo '>>>>>>' 'Init' '<<<<<<'
sudo -i bash < ./scripts/first.bash
echo '>>>>>>' 'LFS edition' '<<<<<<'
echo If needed, password is toor
sudo -i -u lfs bash < ./scripts/lfs.bash
echo '>>>>>>' 'ROOT edition' '<<<<<<'
sudo -i bash < ./scripts/root.bash
sudo -i bash < ./scripts/check.bash
