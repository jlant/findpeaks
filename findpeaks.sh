
# check that the correct number of arguments were supplied
if [ $# -eq 3 ]; then
    echo "3 args!"
    NUMPEAKS=$1
    TYPE=$2
    FILENAME=$3
elif [ $# -eq 2 ]; then
    echo "2 args"
    NUMPEAKS="-1"
    TYPE=$1
    FILENAME=$2
else
    echo "Not enough args supplied!"
    echo "Usage: findpeaks.sh [numpeaks] type files"
    exit 1
fi

# find peaks by cutting the appropriate columns and reverse sorting on the parameter value column (not the datetime column)
echo $FILENAME
grep "^USGS" $FILENAME | cut -f 3-4 | sort -rn -k2 | head $NUMPEAKS