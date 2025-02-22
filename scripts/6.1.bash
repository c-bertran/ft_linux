#/!bin/bash

touch /var/log/{btmp,lastlog,faillog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664  /var/log/lastlog
chmod -v 600  /var/log/btmp

# Deps
bash < ./chrootInstall/main.bash

rm -rf /usr/share/{info,man,doc}/*
find /usr/{lib,libexec} -name \*.la -delete
rm -rf /tools

# Save
while true; do
    read -p "Enter save to quit current shell for save all work" user_command
    if [ "$user_command" == "quit" ]; then
        echo "Exiting program."
        break
    else
        eval "$user_command"
    fi
done
