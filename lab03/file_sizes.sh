#!/bin/sh


echo -n "Small files:"
for file in `ls`
do
    size=$(wc -l < $file)
    if [[ "$size" -ge 0 ]] && [[ "$size" -lt 10 ]]
    then 
        echo -n " "$file
    fi
done
echo


echo -n "Medium-sized files:"
for file in `ls`
do
    size=$(wc -l < $file)
    if [[ "$size" -ge 10 ]] && [[ "$size" -lt 100 ]]
    then 
        echo -n " "$file
    fi
done
echo


echo -n "Large files:"
for file in `ls`
do
    size=$(wc -l < $file)
    if [[ "$size" -ge 100 ]] 
    then 
        echo -n " "$file
    fi
done
echo 

