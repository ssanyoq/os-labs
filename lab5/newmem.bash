#! /bin/bash


array=(0)

i=0

while [[ $i -lt $1 ]]; do
  for ((j = $i; j < i+10; j++)); do
    array+=($j)
  done
  let i=$i+10
done


