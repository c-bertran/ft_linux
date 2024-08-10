#!/bin/bash

dir=$(dirname $0)
for file in `ls -1 $dir | sort -n`; do
    if [ "$file" = "main.bash" ]; then
        continue
    fi
    echo Install $file
    bash $dir/$file
done
