#! /bin/bash

ps -e -o pid,lstart,cmd --sort=start_time | tac | awk 'NR==3 {print $1, $2, $3, $4, $5, $6}'
#3rd last, before ps -e .. process and ./3.bash
