#!/bin/sh

if [ "$#" -ne 2 ]
then
    echo "Usage: ./echon.sh <number of lines> <string>"
    exit
fi

pattern="^[0-9].*"

if [[ ! $1 =~ $pattern ]]
then
    echo "./echon.sh: argument 1 must be a non-negative integer"

else
    num=$1
    str=$2
    count=0
    while [ "$count" -lt "$num" ]
    do
        echo "$str"
        count=`expr $count + 1`
    done

fi
