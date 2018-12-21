#!/bin/sh

for file in *.htm
do
    newFile="$file"l
    
    if test -e "$newFile"
    then 
        echo "$newFile exists"
        exit 1
    fi   
    mv "$file" "$newFile"

done
exit 0
