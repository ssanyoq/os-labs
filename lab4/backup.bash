#! /bin/bash


BACKUP_DIR=$HOME
SOURCE_DIR=$HOME/source
LOG_FILE=$HOME/backup-report

let MIN_ALLOWED_DIFF_S=7*24*60*60

cur_date=$(date +"%Y-%m-%d")
backup_path=$BACKUP_DIR/"Backup-$cur_date"

# Checking if there is recent enough backup

max_s=0
closest_backup_path=''

for name in $(find $BACKUP_DIR -type d -name "Backup-*")
do
  cut_date=$(echo $name | awk -F '-' '{ print $2"-"$3"-"$4 }')
  s=$(date -d $cut_date +%s)
  if [[ $s -gt $max_s ]]; then
    max_s=$s
    closest_backup_path=$BACKUP_DIR/$name
  fi
done


let diff=($(date +%s) - $max_s)

if [[ $diff -lt $MIN_ALLOWED_DIFF_S ]]; then
  echo "Relevant version of backup already exists($closest_backup_path). Adding new files..."
  backup_path=$closest_backup_path
  echo "Backup update: $backup_path made at $(date +'%Y-%m-%d %H:%M:%S')" >> $LOG_FILE 
 
  cur=$PWD
  cd $SOURCE_DIR
  find . -type d -exec mkdir -p -- $backup_path/{} \; # Copying directories
  cd $cur

  for file in $(find $SOURCE_DIR -type f | awk -F $SOURCE_DIR '{print $2}')
  do
    backup_file_size=$(stat $backup_path/$file --printf=%s 2>/dev/null)
    if [[ -z $backup_file_size ]]; then
      echo "File added:$file" >> $LOG_FILE
      cp $SOURCE_DIR/$file $backup_path/$file
    elif [[ $backup_file_size -ne $(stat $SOURCE_DIR/$file --printf=%s) ]]; then
      mv $backup_path/$file $backup_path/$file.$cur_date
      echo "File renamed:$file.$cur_date" >> $LOG_FILE
      cp $SOURCE_DIR/$file $backup_path/$file
      echo "File added:$file" >> $LOG_FILE
    fi
  done
  echo "" >> $LOG_FILE
else 
  mkdir $backup_path

  cp -R $SOURCE_DIR/* $backup_path

  echo "New backup: $backup_path made at $(date +'%Y-%m-%d %H:%M:%S')" >> $LOG_FILE
  find $backup_path -type f | awk -F $backup_path '{print "File added:" $2}' >> $LOG_FILE  
  echo "" >> $LOG_FILE
  echo "New backup created at $backup_path"
fi
