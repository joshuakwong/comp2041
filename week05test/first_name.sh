#!/bin/sh

if [ $# -ne 1 ]
then
    echo "usage: $0 <filename>"
    exit 1
fi

egrep "COMP[29]041" $1 | cut -d"|" -f3 | cut -d"," -f2 | sed "s/^ //" | sort | cut -d" " -f1 | uniq -c | sort | tail -1 | egrep "[A-Z].*" -o

