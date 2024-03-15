#! /bin/bash

if [[ $# -ne 1 ]] 
then
	exit 1;
fi
filename="$PWD/$1"
touch $filename
echo "#! /bin/bash" >> $filename
chmod u+x $filename
