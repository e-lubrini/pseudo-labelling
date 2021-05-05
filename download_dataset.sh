#!/bin/sh

DEFAULT_OF="data.zip"
DEFAULT_OD="data"


URL=$1
OF=${2:-$DEFAULT_OF}
OD=${3:-$DEFAULT_OD}

if command -v axel &> /dev/null
then
    axel --num-connections=8 --output=$OF $URL
elif command -v curl &> /dev/null
then
    curl $URL --output $OF
elif command -v wget &> /dev/null
then
    wget $URL --output-file=$OF
else
    echo "No compatible web download manager found."
    echo "This script is compatible w/ axel, curl and wget"
fi

if command -v unzip &> /dev/null
then
    unzip $OF -d $OD
else
    echo "unzip command does not exist, cannot unzip $OF to $OD"
fi

rm $OF



