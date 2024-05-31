#!/bin/bash

cnt=0
N=$1
K=$2

while [[ "$cnt" -ne "$K" ]]
do
    ./newmem.bash "$N" &
    echo "new one"
    cnt=$(($cnt+1))
    sleep 1s
done
