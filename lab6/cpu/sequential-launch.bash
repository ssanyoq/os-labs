#! /bin/bash

# Launches $1 instances of CPU intense script
# one-by-one

if [[ -z $1 ]]; then
  echo "You need to pass an argument"
  exit 1
fi

for ((i = 0; i < $1; i++)); do
  ./cpu-intense.bash $RANDOM
done

echo "Completed"
