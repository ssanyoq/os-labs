#! /bin/bash

FIFO_FILE=fifo5

while true; do
	read line
	echo "$line" > $FIFO_FILE
	if [[ $line == QUIT  ]]; then
		exit 0
	fi

	if ! [[ $line == [0-9]* || $line == "*" || $line == "+"  ]]; then
		echo "Incorrect input"
		echo "Terminated"
		exit 1
	fi	
done
