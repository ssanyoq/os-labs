#! /bin/bash

> fourth.txt

for pid in $(ps -eo pid --sort=ppid --no-headers | grep -v "\<$$\>"); do
	sum_exec_runtime=$(cat /proc/$pid/sched 2>/dev/null  | grep "sum_exec_runtime" | awk '{print $3}')
	if [[ -z $sum_exec_runtime ]];
	then
	       	continue
	fi
	nr_switches=$(cat /proc/$pid/sched | grep "nr_switches" | awk '{print $3}')
	art=$(echo "scale=10; $sum_exec_runtime / $nr_switches" | bc)
	ppid=$(ps --no-headers -o ppid $pid | tail -n 1 | awk '{print $1}')
	echo "ProcProcessID= $pid : Parent_ProcessID= $ppid : Average_Running_Time= $art" >> fourth.txt
done
