#!/bin/sh

if [ $# -ne 2 ]
then
    echo "Usage: ./echon.sh <number of lines> <string>"
    exit 1
elif ! test $1 -ge 0 2>/dev/null
then
    echo "./echon.sh: argument 1 must be a non-negative integer"
    exit 1
fi

yes $2 | head -n $1
