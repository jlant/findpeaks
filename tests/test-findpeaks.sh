#!/bin/bash

test_3_args()
{
    echo "testing 3 arguments - should print the following"
    echo ""
    echo "data/test-dv.txt"
    echo "  2014-09-04      50"
    echo ""
    bash findpeaks.sh -1 -d data/test-dv.txt    
}

# main
test_3_args
