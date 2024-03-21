#! /bin/bash

max_mem=0
max_mem_pid=-1

for pid_dir in /proc/[0-9]*; do
	mem=$(cat $pid_dir/status | grep "VmRSS" | awk '{print $2}')
	if [[ -n $mem && $mem -gt $max_mem ]] 
	then
		max_mem=$mem
		max_mem_pid=$(basename $pid_dir)
	fi

done

echo "Max RAM consumtion: PID=$max_mem_pid at $max_mem kB"
