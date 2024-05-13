#! /bin/bash

LOG_STEP=100000
LOG_FILE=report.log 
>$LOG_FILE

array=(0)

i=0

while [[ 1 ]]; do
  for ((j = $i; j < i+10; j++)); do
    array+=($j)
  done
  let i=$i+10
  if [[ $(($i % $LOG_STEP)) -eq 0 ]]; then
    echo ${#array[*]} >> $LOG_FILE
    # echo "+1"
  fi
done


