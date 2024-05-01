#! /bin/bash


BACKUP_DIR=$HOME
SOURCE_DIR=$HOME/source
LOG_FILE=$HOME/backup-report

let MIN_ALLOWED_DIFF_S=7*24*60*60

cur_date=$(date +"%Y-%m-%d")
backup_path=$BACKUP_DIR/"Backup-$cur_date"

# Checking if there is recent enough backup

max_s=0

for name in $(find $BACKUP_DIR -type d -name "Backup-*")
do
  cut_date=$(echo $name | awk -F '-' '{ print $2"-"$3"-"$4 }')
  s=$(date -d $cut_date +%s)
  if [[ $s -gt $max_s ]]; then
    max_s=$s
  fi
done


let diff=($(date +%s) - $max_s)

if [[ $diff -lt $MIN_ALLOWED_DIFF_S ]]; then
  echo "Relevant version of backup already exists."
  exit 1
fi

mkdir $backup_path

cp -R $SOURCE_DIR/* $backup_path

echo "New backup: $backup_path made at $(date +'%Y-%m-%d %H:%M:%S')" >> $LOG_FILE
echo "Files:" >> $LOG_FILE
tree $SOURCE_DIR >> $LOG_FILE
echo "" >> $LOG_FILE
