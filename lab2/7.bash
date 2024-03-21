#! /bin/bash

DELAY=60


#if [[ -v array[a] ]] then echo 'aaaaaaa'

#fi

declare -A retro

for pid_dir in /proc/[0-9]*; do 
	pid=$(basename $pid_dir)
	if [[ -d $pid_dir && $pid =~ ^[0-9]+$ && -v $pid_dir/io ]];
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
		if [[ -d /proc/$pid ]] ;then
			read_bytes=$(grep "read_bytes" "/proc/$pid/io" | awk '{print $2}')
			new[$pid]=$read_bytes
		fi
	done
    	sleep 1
done

#for i in "${!new[@]}"
#do
#echo "${i}=${new[$i]}"
#done

>tmp/data.txt

for pid in "${!new[@]}"
do
	if [[ new[$pid] -eq 0 ]] then
		continue
	fi
	data_taken=${new[$pid]}
	if [[ -v retro[$pid] ]] then
		let data_taken=$data_taken-${retro[$pid]}
	fi
	cmd=$(cat /proc/$pid/cmdline | tr '\0' ' ')
	echo "$pid : $cmd: $data_taken" >> tmp/data.txt
done

sort -t ':' -k3n tmp/data.txt | tac | head -n 3
