#! /bin/bash

if [[ -z $1 ]]; then
  echo "Filename is not specified"
  exit 1
fi

>data/$1

LIM=2000000
for ((i = 0; i < $LIM; i++)); do
  echo $RANDOM >> data/$1
done

