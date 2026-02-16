#!/bin/sh

if [ $# -lt 2 ]
then
    echo "Missing arguments!"
    exit 1
fi

mkdir -p $( dirname $1 )
echo $2 > $1