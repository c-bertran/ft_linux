#!/bin/bash

tar xvf sysklogd-*.tar.gz --one-top-level=sysklogd
cd sysklogd
./configure --prefix=/usr      \
            --sysconfdir=/etc  \
            --runstatedir=/run \
            --without-logger
make -j$(nproc)
make install

cat > /etc/syslog.conf << "EOF"
# Début de /etc/syslog.conf

auth,authpriv.* -/var/log/auth.log
*.*;auth,authpriv.none -/var/log/sys.log
daemon.* -/var/log/daemon.log
kern.* -/var/log/kern.log
mail.* -/var/log/mail.log
user.* -/var/log/user.log
*.emerg *

# Ne pas ouvrir de ports internet.
secure_mode 2

# Fin de /etc/syslog.conf
EOF

cd ..
rm -rf sysklogd