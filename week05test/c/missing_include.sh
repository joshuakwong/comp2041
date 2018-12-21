#!/bin/sh

for i in $@
do
    for lib in `egrep "#include \".*\"" $i | egrep "[A-Za-z]+\.[ch]" -o`
    do
        if [ ! -e "$lib" ]
        then
            echo ""$lib" included into "$i" does not exist" 
        fi
    done
done
