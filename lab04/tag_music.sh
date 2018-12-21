#!/bin/sh

for path in "$@"
do
    album=`basename "$path"`
    release_year=`echo "$path" | cut -d "," -f 2 | sed "s/^[ \t]*//"`
    #echo $album
    #echo release_year
    
    for music_pathname in "$path"/*.mp3
    do
        mp3=`basename "$music_pathname" .mp3`
        #echo $mp3
        title=`echo "$mp3" | sed "s/^[0-9]* - //;s/ - .*//"`
        track=`echo "$mp3" | sed "s/ - .*//"`
        artist=`echo "$mp3" | sed "s/.* - //"`
        id3 -t "$title" -T "$track" -a "$artist" -A "$album" -y "$release_year" "$music_pathname" >/dev/null
    
    done
done
