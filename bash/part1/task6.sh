#!/usr/bin/env bash
files=$(find $1 -type f -mtime +7)
for file in $files; do
   rm $file
done

