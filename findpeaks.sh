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

# function to display usage of program
usage(){
    echo "Usage: findpeaks.sh [numpeaks] FILETYPE FILES"
    echo "Example: findpeaks.sh -2 -d sample-daily-value-file.txt"    
}

# check number of arguments; print error and usage if the incorrect number of arguments are entered, otherwise assign appropriately
if [ $# -eq 3 ]; then
    NUMPEAKS=$1
    FILETYPE=$2
    FILENAME=$3
elif [ $# -eq 2 ]; then
    NUMPEAKS="-1"
    FILETYPE=$1
    FILENAME=$2
else
    echo "Incorrect number of args supplied!"
    echo 
    usage
    exit
fi

# find peaks by cutting the appropriate columns and reverse sorting on the parameter value column (not the datetime column)
echo $FILENAME
if [ "$FILETYPE" = "-d" ]; then
    grep "^USGS" $FILENAME | cut -f 3-4 | sort -rn -k2 | head $NUMPEAKS
elif [ "$FILETYPE" = "-u" ]; then
    grep "^USGS" $FILENAME | cut -f 3-5 | sort -rn -k4 | head $NUMPEAKS
fi