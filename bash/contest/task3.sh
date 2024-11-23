#!/bin/bash
INPUT_FILE="input.txt"
OUTPUT_FILE="output.txt"

i=-1
MOD=$((10**9+7))
VAR=0
POLINOMIAL=0
while IFS= read -r LINE; do
	if [ $i -eq -1 ]; then
		X=$LINE
	else
		A=$LINE
		if [ $i -eq 0 ]; then
			VAR=1
		else
			VAR=$((VAR*X%MOD))
		fi;
		POLINOMIAL=$(((POLINOMIAL+A*VAR)%MOD))		
	fi;
	((i++))
done < $INPUT_FILE
echo $POLINOMIAL > $OUTPUT_FILE

