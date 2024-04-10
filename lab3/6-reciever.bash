#! /bin/bash

echo $$ > pid.txt
var=1
mode="idle"

sigterm() {
	echo "SIGTERM recieved, var=$var, quitting..."
	exit 0
}
sigusr1() {
	mode="+"
	let var=$var+2
	echo $var
}
sigusr2() {
	mode="*"
	let var=$var*2
	echo $var
}
trap 'sigterm' SIGTERM
trap 'sigusr1' SIGUSR1
trap 'sigusr2' SIGUSR2

while true; do	
	sleep 1
done


