#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root : su -"
  exit
fi

export LFS=/mnt/lfs
# Init
apt update
apt upgrade -y
apt install -y build-essential bison gawk m4 texinfo curl wget fdisk

# Shell to bash
rm -rf /bin/sh
ln -s /usr/bin/bash /bin/sh

# Awk to Gwak
rm -rf /usr/bin/awk
ln -s /usr/bin/gawk /usr/bin/awk

# Partitioning
fdisk /dev/sda << EOF
g
n


+1M
t
4
n


+200M
t
2
1
n


+4G
t
3
19
n



w
quit
EOF

# mkfs
echo "MKFS & LFS"
mkfs -v -t ext2 /dev/sda2
mkfs -v -t ext4 /dev/sda4
mkswap /dev/sda3
lsblk -o NAME,UUID,FSTYPE,MOUNTPOINT,SIZE /dev/sda

# Start real work
mkdir -pv $LFS
mount -v -t ext4 /dev/sda4 $LFS

swapoff /dev/sda3 
mkswap /dev/sda3
swapon /dev/sda3

# Get packages
mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources

# Make three times
wget --input-file=wget-list-systemd --continue --directory-prefix=$LFS/sources
wget --input-file=wget-list-systemd --continue --directory-prefix=$LFS/sources
wget --input-file=wget-list-systemd --continue --directory-prefix=$LFS/sources

chown root:root $LFS/sources/*

# Prepare lfs structure
mkdir -pv $LFS/tools
ln -sv $LFS/tools /

mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
  ln -sv usr/$i $LFS/$i
done

case $(uname -m) in
x86_64) mkdir -pv $LFS/lib64 ;;
esac

groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
printf 'lfs\nlfs\n' | passwd lfs

chown -v lfs $LFS/tools
chown -v lfs $LFS/sources

chown -v lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -v lfs $LFS/lib64 ;;
esac
