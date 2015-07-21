#!/bin/bash

# Name:
#   findpeaks.sh - finds the largest (peak) value in USGS NWIS (http://waterdata.usgs.gov/nwis) data files
#
# Usage:
#   findpeaks.sh [numpeaks] FILETYPE FILES
#
# Parameters:
#   FILETYPE    [[-d | --daily ] | [-u | --unit]]  
#   FILES       list of data file(s) to process
#
# Options:
#   numpeaks    number of peaks to find 
#
# Description:
#   The findpeaks.sh script finds the largest (peak) value in USGS NWIS (http://waterdata.usgs.gov/nwis) timeseries data files.
#   The data files from the USGS NWIS are either daily timeseries (1 observation per day) or unit timeseries (96 observations
#   per day 15 minute data) 
#
# Example:
#   findpeaks.sh -2 -d sample-daily-value-file.txt 

usage() {
    echo
    echo "Usage: findpeaks.sh [numpeaks] filetype files"
    echo "Example: findpeaks.sh -2 -d sample-daily-value-file.txt"    
}

finddailypeaks() {
    echo "Processing daily timeseries"
    echo
    for file in $2; do
        echo $file
        grep "^USGS" $file | cut -f 3-4 | sort -rn -k2 | head $1
        echo
    done
}

findunitpeaks() {
    echo "Processing unit timeseries"
    echo
    for file in $2; do
        echo $file
        grep "^USGS" $file | cut -f 3-5 | sort -rn -k4 | head $1
        echo
    done
}

# --- main ---

# default number of peaks is 1
numpeaks=-1

# display usage if no arguments are given
if [ $# -eq 0 ]; then
    usage
fi

# loop through arguments and find peaks based on argument flags
while [ $# -gt 0 ]; do
    case "$1" in
        *[[:digit:]]* )         numpeaks=$1 
                                ;;
        -d | --daily )          files=${@:2}
                                finddailypeaks "$numpeaks" "$files"
                                ;; 
        -u | --unit )           files=${@:2}
                                findunitpeaks "$numpeaks" "$files"
                                ;; 
        -h | --help )           usage
                                exit
                                ;;
    esac
    shift
done