#! /bin/bash

# This script is made as a memory
# intense operation, can be calibrated
# only by changing size of test files in ../data/. 
# At my PC it works for around 2.5s on 22MB file, which is 
# perfect for me. It basically reads file number-by-number and writes 
# them multiplied by 2 into another
#
# IMPORTANT: you might want to run ../gen.bash (or ../multgen.bash) 
# before using this thing

if [[ -z $1 ]]; then
  echo "Argumento requiremento >:("
  exit 1
fi

FILE="../data/out$1.txt"
>$FILE

cat "../data/test$1.txt" | awk '{print $1 * 2}' > $FILE
