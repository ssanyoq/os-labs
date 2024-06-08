#! /bin/bash

if [[ -z $1 ]]; then
  echo "Amount is not specified"
  exit 1
fi

for ((i = 0; i < $1; i++)); do
  ./gen.bash "test$i.txt" &
done

