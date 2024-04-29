#! /bin/bash

LOG_FILE=trash.log

#---------------------------CHECKS--------------------

if [ -z "$1" ]; then 
  echo "No argument provided"
  exit 1
fi

arg=$1
bad_characters=""

regex="\/|^(\.\.){1}$|^(\.){1}$" # no '/', not a '..' or '.'

if [[ $1 =~ $regex ]]; then
  echo "Bad filename"
  exit 1
fi

if ! [[ -f $1 ]]; then
  echo "File does not exist"
  exit 1
fi

if [ ! -d "trash" ]; then
  mkdir trash
fi

#-------------------------------------------------------

min_number=0

if ! [ -z "$(ls -A trash)" ]; then
  for filepath in trash/* 
  do
    filename=$(basename $filepath)
    if [[ $filename -eq $min_number ]]; then
      ((min_number++))
   fi
  done
fi 
ln "$1" trash/$min_number
echo "Moved file to: trash/$min_number"

target="'"$PWD/${1//\'/\\\'}"'"

echo "$target  $min_number" >> $LOG_FILE

rm "$1"
