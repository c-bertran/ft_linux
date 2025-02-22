#!/bin/bash

for file in `ls -1 $(dirname $0) | sort -n`; do
    if [[ "$file" != *.bash || "$file" = "main.bash" || "$file" = "1-gcc.bash" ]]; then
        continue
    fi
    echo Install $file
    bash $file
done
