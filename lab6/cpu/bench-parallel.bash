#! /bin/bash

# Script for benchmarking the time it takes to perform N 
# CPU intense tasks in parallel. It logs times with amount of 
# processes in data/parallel.log in format of "<N of tasks> <time it took>".
# Time is written as 0m00.000s, but it still can be parsed easily

mkdir -p data
>data/parallel.log

for ((i = 1; i <= 20; i++)); do
  for ((j = 0; j < 10; j++)); do
    time=$( (time ./parallel-launch.bash $i > /dev/null 2>&1) 2>&1 )
    
    real_time=$(echo $time | grep "real" | awk '{print $2}')
    # echo $real_time
    echo "$i $real_time" >> data/parallel.log
  done
  
done

