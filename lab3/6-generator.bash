#! /bin/bash

pid=$(cat pid.txt)
while true; do
	read line
	if [[ $line == "*" ]]; then
		kill -s SIGUSR2 $pid
	fi
	if [[ $line == "+" ]]; then
		kill -s SIGUSR1 $pid
	fi
	if [[ $line == "TERM" ]]; then
		kill -s SIGTERM $pid
	fi
done
