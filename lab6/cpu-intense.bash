#!/bin/bash

# Function to perform CPU-intensive operations
cpu_intensive_task() {
    local n=$1
    local iterations=200000  # Adjust this number for desired CPU time
    local result=0

    for ((i = 0; i < iterations; i++)); do
        result=$((result + (n * n) - (n / 2) + (n % 3) - (n ** 3)))
        result=$((result ^ i))  # Adding some additional operations to keep the CPU busy
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

