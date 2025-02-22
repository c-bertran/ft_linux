grub-install /dev/sda
cat > /boot/grub/grub.cfg << EOF
set default=0
set timeout=5

menuentry "Linux From Scratch" {
    set root=(hd0,1)
    linux /boot/vmlinuz-$(make kernelrelease) root=/dev/sda4 ro
    initrd /boot/initrd.img-$(make kernelrelease)
}
EOF
