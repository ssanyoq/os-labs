#! /bin/bash

if [[ $# -lt 3 ]] 
then echo Bad
	exit 1
fi

out=$(echo $@ | tr " " "\n" | sort -r -n | head -n 1)
echo $out
