#! /bin/bash

echo '' > fourth.txt

for pid in $(ps -eo pid --sort=ppid --no-headers); do
	sum_exec_runtime=$(cat /proc/$pid/sched 2>/dev/null | grep "sum_exec_runtime" | awk '{print $3}')
	nr_switches=$(cat /proc/$pid/sched 2>/dev/null | grep "nr_switches" | awk '{print $3}')
	art=$(echo "scale=10; $sum_exec_runtime / $nr_switches" | bc 2>/dev/null)
	ppid=$(ps -o ppid $pid | tail -n 1 | awk '{print $1}')
	if [[ $art != '' ]]
	then echo "ProcProcessID=$pid : Parent_ProcessID=$ppid : Average_Running_Time=$art" >> fourth.txt
	fi
done
