#!/usr/bin/env bash
MATRIX="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

while [ "${n:=1}" -le $1 ]
do
	PASS="$PASS${MATRIX:$((RANDOM%${#MATRIX})):1}"
	(( n+=1 ))
done
echo $PASS

