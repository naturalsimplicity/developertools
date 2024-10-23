#!/usr/bin/env bash
dt=$(date +%Y-%m-%d)
tar -zcvf "some_archive_$dt.tar.gz" $1 
