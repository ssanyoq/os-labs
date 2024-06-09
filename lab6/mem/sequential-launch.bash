#! /bin/bash

if [[ -z $1 ]]; then
  echo "You need to pass an argument"
  exit 1
fi

for ((i = 0; i < $1; i++)); do
  ./mem-intense.bash $i
done

echo "Completed"
