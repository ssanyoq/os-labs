#! /bin/bash

RESTORE_DIR=$HOME/restore
BACKUP_DIR=$HOME/
LOG_FILE=$HOME/backup-report

rm -r $RESTORE_DIR 2>/dev/null
mkdir $RESTORE_DIR

max_s=0
closest_backup_name=''

for name in $(find $BACKUP_DIR -type d -name "Backup-*")
do
  cut_date=$(echo $name | awk -F '-' '{ print $2"-"$3"-"$4 }')
  s=$(date -d $cut_date +%s)
  if [[ $s -gt $max_s ]]; then
    max_s=$s
    closest_backup_name=$name
  fi
done

if [[ $closest_backup_name == '' ]]; then
  echo "0 backups were found"
  exit 1
fi

echo "Copying closest backup($BACKUP_DIR/$closest_backup_name) into $RESTORE_DIR..."

cp -R $BACKUP_DIR/$closest_backup_name/* $RESTORE_DIR

#looking for previous versions


is_the_one=0
while read -r line
do 
  if  ! [[ -z $(echo $line | grep $closest_backup_name) ]]; then
    is_the_one=1
    continue
  elif [[ $is_the_one != 1 ]]; then
    continue
  fi
  if [[ $line == '' ]]; then
    is_the_one=0
    continue
  fi
  status=$(echo $line | awk -F ':' '{print $1}')
  if [[ $status == 'File renamed' ]]; then
    file=$(echo $line | awk -F ':' '{print $2}')
    if [[ -f $RESTORE_DIR/$file ]]; then
      rm $RESTORE_DIR/$file
      echo "Copy of file($file) was deleted"
    fi
  fi
done < $LOG_FILE

echo "Upbacking is completed"


