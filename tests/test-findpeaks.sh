#!/bin/bash

test_3_args()
{
    echo "testing 3 arguments"
    echo ""
    bash findpeaks.sh -1 -d data/test-dv.txt    
}

# main
test_3_args
