#/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root : su -"
  exit
fi

# Init
apt update
apt upgrade -y
apt install -y build-essential bison gawk m4 texinfo curl
rm -rf /bin/sh
ln -s /usr/bin/bash /bin/sh

# Partitioning
fdisk /dev/sdb << EOF
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
mkfs -v -t ext2 /dev/sdb2
mkfs -v -t ext4 /dev/sdb4
mkswap /dev/sdb3
lsblk -o NAME,UUID,FSTYPE,MOUNTPOINT,SIZE /dev/sdb

# Start real work
mkdir -v $LFS
mount -v -t ext4 /dev/sdb4 $LFS

swapoff /dev/sdb3 
mkswap /dev/sdb3
swapon /dev/sdb3

# Get packages
mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources
wget --input-file=wget-list-systemd --continue --directory-prefix=$LFS/sources

# Prepare lfs structure
mkdir -v $LFS/tools
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
printf 'toor\ntoor\n' | passwd lfs

chown -v lfs $LFS/tools
chown -v lfs $LFS/sources

chown -v lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -v lfs $LFS/lib64 ;;
esac
