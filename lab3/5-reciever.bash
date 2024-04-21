#! /bin/bash

FIFO_FILE=fifo5

mode="addition"
var=1
tail -f $FIFO_FILE |
while true; do
	read line
	case $line in 
		'*')
			mode="multiplying"
			echo "Switched mode to $mode"
		;;
		"+")
			mode="addition"
			echo "Switched mode to $mode"
		;;
		"QUIT")
			mode="exit"
			echo "Exiting"
			pkill --parent $$
			exit 0
			;;
		[0-9]*)
			case $mode in
				"multiplying")
					var=$(($var * $line))
				;;
				"addition")
					var=$(($var + $line))
				;;
			esac
			echo changed to $var
		;;
		*)
			echo "Incorrect input"
			pkill --parent $$			
			exit 1
		;;
	esac		
done
