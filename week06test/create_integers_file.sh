#!/bin/sh

i=$1

while [ $i -le $2 ]
do
    echo $i
    i=`expr $i + 1`
done > $3
