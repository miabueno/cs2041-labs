#!/bin/sh

for file in "$@"
do
    version=0
    while [ -e ".$file.$version" ]
    do
        ((version=version+1))
    done
    
    cp "$file" ".$file.$version"
    echo "Backup of '$file' saved as '.$file.$version'"

done
