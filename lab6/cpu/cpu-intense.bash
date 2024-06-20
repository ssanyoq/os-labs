#!/bin/bash

# Script that does CPU intensive task. It counts
# some random sequence element, I calibrated it to
# calculate for around 3.6 seconds on my PC.
# Time of calculation does not change by changing the 
# argument of a script

# Function to perform CPU-intensive operations
cpu_intensive_task() {
    local n=$1
    local iterations=200000  # Adjust this number for desired CPU time
    local result=0

    for ((i = 0; i < iterations; i++)); do
        result=$((result + (n * n) - (n / 2) + (n % 3) - (n ** 3)))
        result=$((result ^ i))
    done

    echo $result
}

# Check if the argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 number"
    exit 1
fi

# Check if the argument is a valid number
if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Error: Argument must be a positive integer"
    exit 1
fi

# Get the number from the arguments
number=$1

# Perform CPU-intensive task
result=$(cpu_intensive_task $number)

# Print the result
echo $result

