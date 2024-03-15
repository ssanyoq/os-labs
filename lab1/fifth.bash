#! /bin/bash

filename=~/.bash_history

cat $filename | awk '$2 == "clone"' > info.log

