#! /bin/bash

if [[ -z $1 ]]; then
  echo "Argumento requiremento >:("
  exit 1
fi

FILE="../data/out$1.txt"
>$FILE

cat "../data/test$1.txt" | awk '{print $1 * 2}' > $FILE
