#!/bin/bash

#  LFS-Bootscripts
cd /sources
mkdir lfs
tar xf lfs-bootscripts-*.tar.xz -C lfs --strip-components=1
cd lfs
make install
cd ..
rm -rf lfs

# Managing Devices 
bash /usr/lib/udev/init-net-rules.sh
cat /etc/udev/rules.d/70-persistent-net.rules

# General Network Configuration
ENP=$(ls /sys/class/net | head -n 1)
ENP_IP=$(ip a show enp0s3 | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1)
ENP_GATEWAY=$(echo $ENP_IP | sed 's/\.[0-9]*$/\.45/')
ENP_BRODCAST=$(ip a show enp0s3 | grep "inet " | awk '{print $4}' | cut -d'/' -f1)

cd /etc/sysconfig/
cat > ifconfig.eth0 << "EOF"
ONBOOT=yes
IFACE=eth0
SERVICE=ipv4-static
IP=192.168.1.2
GATEWAY=192.168.1.1
PREFIX=24
BROADCAST=192.168.1.255
EOF

cat > ifconfig.$ENP << EOF
ONBOOT=yes
IFACE=$ENP
SERVICE=ipv4-static
IP=$ENP_IP
GATEWAY=$ENP_GATEWAY
PREFIX=24
BROADCAST=$ENP_BRODCAST
EOF

cat > /etc/resolv.conf << "EOF"
# Begin /etc/resolv.conf

nameserver 8.8.8.8
nameserver 8.8.4.4

# End /etc/resolv.conf
EOF

HOSTNAME=cbertran
echo $HOSTNAME > /etc/hostname
cat > /etc/hosts << EOF
# Begin /etc/hosts

127.0.0.1 localhost.localdomain localhost
$ENP_IP $HOSTNAME
::1       localhost ip6-localhost ip6-loopback
ff02::1   ip6-allnodes
ff02::2   ip6-allrouters

# End /etc/hosts
EOF