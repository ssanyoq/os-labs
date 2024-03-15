#! /bin/bash
read input
output=""
while [[ $input != q ]]
do
  if [[ $output == "" ]] 
    then output=$input;
    else output="$output; $input";
  fi
  read input
done
echo $output
