#!/usr/bin/env bash
NAME=$1

function add_hello {
    echo "Hello, $NAME"
}

function sum_nums {
    echo "$(( $1 + $2 ))"
}

add_hello
RESULT=$(sum_nums 1 2)
echo "Result of 1 + 2 is $RESULT"

