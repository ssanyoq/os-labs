#! /bin/bash

if [ -z "$1" ]; then 
  echo "No argument provided"
  exit 1
fi

argument="'"${1//'/\\'}"'"
  echo $argument

regex="\/|^(\.\.){1}$|^(\.){1}$"

if [[ $1 =~ $regex ]]; then
  echo "Bad filename"
  exit 1
fi

if ! [ -f $1 ]; then
  echo "File does not exist"
  exit 1
fi

if [ ! -d "trash" ]; then
  mkdir trash
fi


echo "sucks ass"
