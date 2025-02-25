#!/bin/bash

printf '\033]2;Bash\a'
mkdir bash
tar xf bash-*.tar.gz -C bash  --strip-components=1
cd bash
./configure --prefix=/usr             \
            --without-bash-malloc     \
            --with-installed-readline \
            bash_cv_strtold_broken=no \
            --docdir=/usr/share/doc/bash-5.2.32
make
chown -R tester .
su -s /usr/bin/expect tester << "EOF"
set timeout -1
spawn make tests
expect eof
lassign [wait] _ _ _ value
exit $value
EOF
make install
cd ..
rm -rf bash

echo "Execute this command: " "exec /usr/bin/bash --login"
