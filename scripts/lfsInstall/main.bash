#!/bin/bash

dir=$(dirname $0)
for file in `ls -1 $dir | sort -n`; do
    if [[ "$file" != *.bash || "$file" = "main.bash" ]]; then
        continue
    fi
    echo Install $file
    printf "\033]2;$file\a"
    bash $dir/$file
done
