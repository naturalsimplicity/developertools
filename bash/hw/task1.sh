#!/usr/bin/env bash
FILE_PATH=$1

if [ -f $FILE_PATH ]; then
    echo "$(basename $FILE_PATH) exists"
else
    echo "$(basename $FILE_PATH) does not exist"
fi;

for FILE in ./*; do
    IS_DIR=file
    if [ -d $FILE ]; then
        IS_DIR=directory
    fi
    echo "$(stat $FILE | awk '{ print $28 " " $3 }') $IS_DIR"
done;
