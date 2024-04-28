#! /bin/bash

LOG_FILE=trash.log

#---------------------------CHECKS--------------------

if [ -z "$1" ]; then 
  echo "No argument provided"
  exit 1
fi


regex="\/|^(\.\.){1}$|^(\.){1}$"

if [[ $1 =~ $regex ]]; then
  echo "Bad filename"
  exit 1
fi

#-------------------------------------------------------


while IFS=" " read -r quotes_filepath link; do 
  filepath=${quotes_filepath:1:-1}
  filename=$(basename $filepath)
  if [[ $filename == $1 ]]; then
    echo "match found"
  fi
done < $LOG_FILE
