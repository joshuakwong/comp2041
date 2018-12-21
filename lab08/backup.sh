#!/bin/sh

if [ ! -f $1 ]
then
    echo "file cannot be opened"
    exit
fi

i=0
filename=".""$1"".""$i"
while [ -f $filename ]
do
    i=`expr $i + 1`
    filename=".""$1"".""$i"
done

cp $1 $filename
echo "Backup of '$1' saved as '$filename'"
