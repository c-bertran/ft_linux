#!/bin/bash

umount /boot
mount /dev/sda2 /boot
mount --bind /boot /mnt/lfs/boot
