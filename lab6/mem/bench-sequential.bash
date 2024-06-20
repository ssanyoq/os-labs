#! /bin/bash

# Script for benchmarking the time it takes to perform N 
# memory intense tasks one-by-one. It logs times with amount of 
# processes in data/sequential.log in format of "<N of tasks> <time it took>".
# Time is written as 0m00.000s, but it still can be parsed easily

mkdir -p data
>data/sequential.log

for ((i = 1; i <= 20; i++)); do
  for ((j = 0; j < 10; j++)); do
    time=$( (time ./sequential-launch.bash $i > /dev/null 2>&1) 2>&1 )
    
    real_time=$(echo $time | grep "real" | awk '{print $2}')
    # echo $real_time
    echo "$i $real_time" >> data/sequential.log
  done
  
done

