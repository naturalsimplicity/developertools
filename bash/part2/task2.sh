#!/usr/bin/env bash
if [[ $1 -eq $2 ]]; then
    echo "$1 is equal to $2"
elif [[ $1 -lt $2 ]]; then
    echo "$1 is less than $2"
else
    echo "$1 is greater than $2"
fi

