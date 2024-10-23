#!/usr/bin/env bash
host=$1
ping $host -c1 &> /dev/null
result=$?
if [[ result -eq 0 ]]; then
    echo "Server $host is available"
else
    echo "Server $host is unavailable"
fi

