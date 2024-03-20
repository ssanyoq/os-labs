#! /bin/bash


ps -eo pid,ppid,stime,cmd --sort=-stime | grep -E -v "\<$$\>" | head -n 2 | awk '{print $1,$3}'

