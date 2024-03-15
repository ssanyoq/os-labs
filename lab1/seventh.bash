#! /bin/bash

DIR="emails/"

grep -r -E -h -o '[a-zA-Z0-9]+@[a-zA-Z0-9]{2,}(\.[a-zA-Z0-9]{2,})+' $DIR

