#! /bin/bash

>data/parallel.log

for ((i = 0; i < 20; i++)); do
  for ((j = 0; j < 10; j++)); do
    time=$( (time ./parallel-launch.bash $i > /dev/null 2>&1) 2>&1 )
    
    real_time=$(echo $time | grep "real" | awk '{print $2}')
    # echo $real_time
    echo "$i $real_time" >> data/parallel.log
  done
  
done

