#! /bin/bash

# Script creates a new text file of name that is specified as an argument
# It fills is with random numbers(as needed in the lab description)
# Resulting file with LIM=2000000 takes up around 11MB of disk space

if [[ -z $1 ]]; then
  echo "Filename is not specified"
  exit 1
fi

mkdir -p data
>data/$1

LIM=2000000
for ((i = 0; i < $LIM; i++)); do
  echo $RANDOM >> data/$1
done

