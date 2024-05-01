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

matches=0
>tmp.log
while IFS= read -r line; do
  keep=1
  quotes_filepath=$(awk '{ last = $NF; $NF = ""; print substr($0, 1, length($0)-1) }' <<< $line)
  link=$(awk '{ print $NF }' <<< $line)
  filepath=${quotes_filepath:1:-1}
  filename=$(awk -F '/' '{ print $NF }' <<< $filepath)
  # echo path: $filepath
  # echo file: $filename
  # echo arg: $1
  echo ""
  if [[ $filename == $1 ]]; then
    ((matches++))
    echo "Match found: $filepath"
    echo "" 
    read -p "Do you want to untrash it? [Y/n] " choice </dev/tty
    case "$choice" in
      [Yy]*) 
        if [[ -e $filepath ]]; then
          number=0
          while [[ -e $filepath\_$number ]]; do
            ((number++))
          done
          filepath=$filepath\_$number
        fi  
        ln "trash/$link" "$filepath"
        echo "File untrashed successfully"
        keep=0
        ;;
      *) echo Skipping file
      ;;
    esac
  fi
  if [[ $keep -eq 1 ]]; then
    echo $line >> tmp.log
  fi
done < $LOG_FILE

rm $LOG_FILE
mv tmp.log $LOG_FILE

if [[ matches -eq 0 ]]; then
  echo "No matches found"
fi

