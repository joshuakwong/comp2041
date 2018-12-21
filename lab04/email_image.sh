#!/bin/sh

for file in $@
do
    echo "$file"
    echo -n "Address to e-mail this image to? " 
    read recipient
    echo -n "Message to accompany image? "
    read message
    fileName=`echo "$file" | cut -d"." -f1`
    topic="$fileName""!"
    echo ""$message"" | mutt -s ""$topic"" -e 'set copy=no' -a "$file" -- "$recipient"
done
