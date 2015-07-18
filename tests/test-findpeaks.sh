#!/bin/bash

test_3_args_1_peak_1_daily_value_file()
{
    echo "Testing 3 arguments 1 peak 1 daily value file"
    echo ""
    echo "Expected:"
    echo ""
    echo "tests/test-dv.txt"
    echo "2014-09-04      50"
    echo ""
    echo "Actual:"
    echo ""
    bash findpeaks.sh -1 -d tests/test-dv.txt    
    echo ""
    echo "---"
}

test_3_args_3_peaks_1_daily_value_file()
{
    echo "Testing 3 arguments 3 peaks 1 daily value file"
    echo ""
    echo "Expected:"
    echo ""
    echo "tests/test-dv.txt"
    echo "2014-09-04      50"
    echo "2014-09-03      40"
    echo "2014-09-05      50"
    echo ""
    echo "Actual:"
    echo ""
    bash findpeaks.sh -3 -d tests/test-dv.txt  
    echo ""
    echo "---"
}

test_2_args_1_peak_1_daily_value_file()
{
    echo "Testing 2 arguments 1 peak 1 daily value file - should use default of 1 for number of peaks"
    echo ""
    echo "Expected:"
    echo ""
    echo "tests/test-dv.txt"
    echo "2014-09-04      50"
    echo ""
    echo "Actual:"
    echo ""
    bash findpeaks.sh -d tests/test-dv.txt    
    echo ""
    echo "---"
}

test_1_args_echo_error()
{
    echo "Testing 1 arguments 1 peak 1 daily value file - should use default of 1 for number of peaks"
    echo ""
    echo "Expected:"
    echo ""
    echo "Not enough args supplied!"
    echo "Usage: findpeaks.sh [numpeaks] type files"
    echo ""
    echo "Actual:"
    echo ""
    bash findpeaks.sh tests/test-dv.txt    
    echo ""
    echo "---"
}

test_3_args_1_peak_1_unit_value_file()
{
    echo "Testing 3 arguments 1 peak 1 unit value file"
    echo ""
    echo "Expected:"
    echo ""
    echo "tests/test-uv.txt"
    echo "2015-03-16 00:30        EDT     20"
    echo ""
    echo "Actual:"
    echo ""
    bash findpeaks.sh -1 -u tests/test-uv.txt    
    echo ""
    echo "---"
}

# main
test_3_args_1_peak_1_daily_value_file
test_3_args_3_peaks_1_daily_value_file
test_2_args_1_peak_1_daily_value_file
test_1_args_echo_error
test_3_args_1_peak_1_unit_value_file
