#! /bin/bash

DELAY=6

>tmp/pids.txt

#if [[ -v array[a] ]] then echo 'aaaaaaa'

#fi

declare -A retro

for pid_dir in /proc/[0-9]*; do 
	pid=$(basename $pid_dir)
	if [[ -d $pid_dir && $pid =~ ^[0-9]+$ && $pid -ne $$ ]];
	then
		read_bytes=$(cat $pid_dir/io | grep "read_bytes" | awk '{print $2}')
		retro[$pid]=$read_bytes
	fi
done
#for i in "${!retro[@]}"
#do
#echo "${i}=${retro[$i]}"
#done

declare -A new

end_time=$(( $(date +%s) + $DELAY ))
while [ $(date +%s) -lt $end_time ]; do 
	cur_pids=$(pgrep -d ' ' .)
	for pid in $cur_pids; do
		read_bytes=$(grep "read_bytes" "/proc/$pid/io" | awk '{print $2}')
		new[$pid]=$read_bytes
	done
    	sleep 1
done

for i in "${!new[@]}"
do
echo "${i}=${new[$i]}"
done



