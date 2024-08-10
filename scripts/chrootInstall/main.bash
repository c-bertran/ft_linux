#!/bin/bash

for file in `ls -1 $(dirname $0) | sort -n`; do
    if [ "$file" = "main.bash" ]; then
        continue
    fi
    echo Install $file
    bash $file
done
