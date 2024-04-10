#! /bin/bash

./4-gen.bash&PID1=$!
./4-gen.bash&PID2=$!
./4-gen.bash&PID3=$!

#echo $PID1 $PID2 $PID3
cpulimit --pid $PID1 --limit 10 -b
kill $PID3


