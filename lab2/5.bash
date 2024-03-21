#! /bin/bash

> fifth.txt

last_ppid=-1
sum=0
amt=0

while read -r line; do
	cur_ppid=$(echo $line | awk '{print $5}')
	cur_art=$(echo $line | awk '{print $8}')
	if [[ $last_ppid -ne $cur_ppid ]];
	then
		if [[ $amt -ne 0 ]]; 
		then
			echo "Average_Running_Children_of_ParentID = $last_ppid is $(echo "scale=10; $sum / $amt" | bc)" >> fifth.txt
		fi
		sum=0
		amt=0
		last_ppid=$cur_ppid	
	fi
	sum=$(echo "scale=10; $sum + $cur_art" | bc)
	let amt=$amt+1
	echo $line >> fifth.txt
done < fourth.txt

echo "Average_Running_Children_of_ParentID = $last_ppid is $(echo "scale=10; $sum / $amt" | bc)" >> fifth.txt

