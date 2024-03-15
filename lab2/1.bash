#! /bin/bash

let amt=$(ps -u kutsalo.ap | wc -l)-2
echo $amt > first.txt
ps -u kutsalo.ap | awk '{print $1,$4}'
