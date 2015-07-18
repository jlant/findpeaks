#!/bin/bash

# check that the correct number of arguments were supplied
if [ $# -eq 3 ]; then
    NUMPEAKS=$1
    TYPE=$2
    FILENAME=$3
elif [ $# -eq 2 ]; then
    NUMPEAKS="-1"
    TYPE=$1
    FILENAME=$2
else
    echo "Incorrect number of args supplied!"
    echo "Usage: findpeaks.sh [numpeaks] type files"
    echo "Example: findpeaks.sh -2 -d sample-daily-value-file.txt"
    exit
fi

# find peaks by cutting the appropriate columns and reverse sorting on the parameter value column (not the datetime column)
echo $FILENAME
if [ "$TYPE" = "-d" ]; then
    grep "^USGS" $FILENAME | cut -f 3-4 | sort -rn -k2 | head $NUMPEAKS
elif [ "$TYPE" = "-u" ]; then
    grep "^USGS" $FILENAME | cut -f 3-5 | sort -rn -k4 | head $NUMPEAKS
fi