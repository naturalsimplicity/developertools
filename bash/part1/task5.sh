#!/usr/bin/env bash
for file in $1/*; do
    dn=$(dirname $file)
    fn=$(basename $file)
    mv $file "$dn/backup_$fn"
done


