#! /bin/bash

./4-gen.bash&PID1=$!
./4-gen.bash&PID2=$!
./4-gen.bash&PID3=$!

echo $PID1 $PID2 $PID3
while true; do
	(cpu=$(ps -p $PID1 -o %cpu | awk '{ print $1 }' | tail -1)
	if [[ $(echo "$cpu > 10" | bc -l) -eq 1 ]] then
		renice -n 19 $PID1 2> /dev/null
		sleep 2
		renice -n 0 $PID1 2> /dev/null
	fi)
done
cpulimit --pid $PID1 --limit 10 &
kill $PID3


