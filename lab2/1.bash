#! /bin/bash

let amt=$(ps -u user | wc -l)-3 #bash, script, ps
echo $amt > first.txt
ps -u user
ps -u user -o pid,cmd | head -n -4
