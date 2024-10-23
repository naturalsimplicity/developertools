#!/usr/bin/env bash
DIR_PATH=$1

find . -type f -name "*.log" -exec stat -f "%N %B" {} + | sort -r -k2
