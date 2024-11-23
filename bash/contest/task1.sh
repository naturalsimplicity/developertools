#!/bin/bash
INPUT_FILE="input.txt"
OUTPUT_FILE="output.txt"

read LINES WORDS <<< $(cat $INPUT_FILE | wc -lw)
read LETTERS <<< $(cat $INPUT_FILE | grep -o "[a-zA-Z]" | wc -l)
echo "Input file contains:" > $OUTPUT_FILE
echo "$LETTERS letters" >> $OUTPUT_FILE
echo "$WORDS words" >> $OUTPUT_FILE
echo "$LINES lines" >> $OUTPUT_FILE
