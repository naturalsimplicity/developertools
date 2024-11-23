#!/bin/bash
INPUT_FILE="input.txt"
OUTPUT_FILE="output.txt"

N=$(head -n1 $INPUT_FILE)
MODE=$(tail -n1 $INPUT_FILE)
case "$MODE" in
	date )
		tail -n+2 input.txt | head -n $N | sort -k5n -k4n -k3n -k2 -k1 \
		| awk '{ print $1 " " $2 " " $3 "." $4 "." $5 }' > $OUTPUT_FILE
		;;
	name )
		tail -n+2 input.txt | head -n $N | sort -k2 -k1 -k5n -k4n -k3n \
		| awk '{ print $1 " " $2 " " $3 "." $4 "." $5 }' > $OUTPUT_FILE
		;;
esac;

