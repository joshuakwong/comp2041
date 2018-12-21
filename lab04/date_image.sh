#!/bin/sh

result=`ls -l $1 `
month=`echo $result | cut -d" " -f6`
date=`echo $result | cut -d" " -f7`
timestamp=`echo $result | cut -d" " -f8`
toPrint="$month  $date  $timestamp"

fileName=`echo "$1" | cut -d"." -f1`
convert -gravity south -pointsize 36 -draw "text 0,10 '$toPrint'" $1 tmp.jpg
