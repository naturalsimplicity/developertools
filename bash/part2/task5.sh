#!/usr/bin/env bash
for file in $1/*; do
    dir_name=$(dirname $file)
    file_name=$(basename $file)
    name_lower=$(echo $file_name | tr '[:upper:]' '[:lower:]')
    mv $file "$dir_name/$name_lower"
done
