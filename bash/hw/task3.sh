#!/usr/bin/env bash
echo "Введите число: "
read NUMBER
if [ $NUMBER -gt 0 ]; then
    echo "$NUMBER - положительное число"
    i=1
    while [ $i -le $NUMBER ]; do
        echo "$i"
        i=$((i+1))
    done;
elif [ $NUMBER -le 0 ]; then
    echo "$NUMBER - отрицательное число"
else
    echo "$NUMBER - нуль"
fi;

 
