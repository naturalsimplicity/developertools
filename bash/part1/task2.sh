#!/usr/bin/env bash
echo "Write file name"
read filename

if [[ -e $filename ]]; then
    echo "File found!"
else
    echo "File does not exist"
fi
