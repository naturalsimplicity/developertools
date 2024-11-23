#!/bin/bash
INPUT_FILE="input.txt"
OUTPUT_FILE="output.txt"

PATTERN="(https?:\/\/)?([a-zA-Z.0-9]+)(:[0-9]+)?\/?(\?.+)?"
while IFS= read -r LINE; do
	LINE=$(echo $LINE | sed 's/google/yandex/g')
	if [[ $LINE =~ $PATTERN ]]; then
		if [[ ${BASH_REMATCH[1]} ]]; then
			echo "Scheme: ${BASH_REMATCH[1]}" >> $OUTPUT_FILE
		fi;
		if [[ ${BASH_REMATCH[2]} ]]; then
			echo "Host: ${BASH_REMATCH[2]}" >> $OUTPUT_FILE
		fi;
		if [[ ${BASH_REMATCH[3]} ]]; then
			echo "Port: ${BASH_REMATCH[3]#:}" >> $OUTPUT_FILE
		fi;
		if [[ ${BASH_REMATCH[4]} ]]; then
			echo "Args:" >> $OUTPUT_FILE
			IFS='&' read -ra ARGS <<< "${BASH_REMATCH[4]#?}"
			for param in "${ARGS[@]}"; do
  				echo "  Key: ${param%=*}; Value: ${param#*=}" >> $OUTPUT_FILE
			done
		fi;
	else
		echo "URL does not match pattern" >> $OUTPUT_FILE
	fi;
	echo "" >> $OUTPUT_FILE
done < $INPUT_FILE

