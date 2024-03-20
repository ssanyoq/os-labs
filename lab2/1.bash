#!/bin/bash

# Get the PID of the current script
SCRIPT_PID=$$

# Get the PPIDs of processes spawned by the script
CHILD_PPIDS=$(pgrep -P $SCRIPT_PID)
echo $SCRIPT_PID
echo $CHILD_PPIDS
# Print out ps excluding processes with the script's PID and its child PPIDs
ps -eo pid,ppid,cmd | grep -v "\<$$\>" | awk '{print $1, $3}' 

