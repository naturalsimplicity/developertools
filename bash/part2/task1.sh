#!/usr/bin/env bash
echo $(cat $1 | grep -o "$2" | wc -l)

