#!/bin/sh

for i in $1/*
do
    filename=`echo "$i" | sed 's/.*\///' `
    if [ -e "$2/$filename" ]
    then
        #echo "hit $filename"
        diff "$1/$filename" "$2/$filename" >tmp
        grep ">" tmp >/dev/null
        if [ $? -ne 0 ]
        then 
            echo "$filename";
        fi
    fi
done
