#!/bin/sh

#set -x
IFS='\n'
newExtension=".png"

for file in *.jpg
do
     
    fileName=`echo "$file" | cut -d"." -f1`
    newPNG="$fileName""$newExtension"
    if [ -e "$newPNG" ]
    then
        echo "$newPNG" already exists
        break
    fi
    convert "$file" "$newPNG"
    rm "$file"
done
