#! /bin/bash


man bash | grep -o " [A-Za-z][a-z]\{3,\}" | tr -d " " | sort -f | uniq -ci | sort -n -k2 -r | head -n3
