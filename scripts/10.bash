#!/bin/bash

cat > /etc/fstab << "EOF"
# Begin /etc/fstab

# file system  mount-point    type     options             dump  fsck
#                                                                order

/dev/sda2      /boot          ext2     defaults            0     0
/dev/sda4      /              ext4     defaults            1     1
/dev/sda3      swap           swap     pri=1               0     0
proc           /proc          proc     nosuid,noexec,nodev 0     0
sysfs          /sys           sysfs    nosuid,noexec,nodev 0     0
devpts         /dev/pts       devpts   gid=5,mode=620      0     0
tmpfs          /run           tmpfs    defaults            0     0
devtmpfs       /dev           devtmpfs mode=0755,nosuid    0     0
tmpfs          /dev/shm       tmpfs    nosuid,nodev        0     0
cgroup2        /sys/fs/cgroup cgroup2  nosuid,noexec,nodev 0     0

# End /etc/fstab
EOF

# Install Linux Kernel
cd /sources
mkdir linux
tar xf linux-6.*.tar.xz -C linux --strip-components=1
cd linux
make mrproper
make defconfig
make menuconfig
make
make modules_install

echo "Open a new bash under current OS with root right, and execute ./scripts/10.1.bash, after return here"
echo "Press enter to continue"
read -r userInput

mount /boot
HOSTNAME=cbertran
cp -iv arch/x86/boot/bzImage /boot/vmlinuz-6.10.5-$HOSTNAME
cp -iv arch/x86_64/boot/bzImage /boot/vmlinuz-x64-6.10.5-$HOSTNAME
cp -iv System.map /boot/System.map-6.10.5
cp -iv .config /boot/config-6.10.5
cp -r Documentation -T /usr/share/doc/linux-6.10.5
chown -R 0:0 ../linux

install -v -m755 -d /etc/modprobe.d
cat > /etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/usb.conf

install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

# End /etc/modprobe.d/usb.conf
EOF

# Using GRUB to Set Up the Boot Process 
grub-install /dev/sda
cat > /boot/grub/grub.cfg << EOF
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

insmod part_gpt
insmod ext2
set root=(hd0,2)

menuentry "GNU/Linux, Linux 6.10.5-$HOSTNAME" {
        linux   /vmlinuz-x64-6.10.5-$HOSTNAME root=/dev/sda4 ro
}
EOF