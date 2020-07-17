#!/bin/dash

snapshot-save.sh

version=$1

curr_dir=".snapshot.$version"

if [ -d $curr_dir ]
then
    echo "Restoring snapshot $suffix"
    cp -p $curr_dir/* .
fi


