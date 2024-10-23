#!/usr/bin/env bash
read available used <<< $(df | awk '{ if ($9=="/System/Volumes/Data") print $2 " " $3 }')
if [[ $((used*100/available)) -gt 80 ]]; then
    echo "More than 80% of disk space is used"
else
    echo "Less than 80% of disk space is used"
fi
