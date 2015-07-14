NUMPEAKS=$1
TYPE=$2
FILENAME=$3

echo $FILENAME
grep "^USGS" $FILENAME | cut -f 3-4 | sort -rn -k2 | head $NUMPEAKS