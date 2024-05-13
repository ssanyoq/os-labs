#! /bin/bash

echo "RAM  size      : $(free -h | tail -2 | head -1 | awk '{print $2}')"
echo "SWAP size      : $(free -h | tail -1 | awk '{print $2}')"
echo "Page size      : $(getconf PAGE_SIZE) bytes"
echo "RAM available  : $(free -h | tail -2 | head -1 | awk '{print $4}')"
echo "SWAP available : $(free -h | tail -1 | awk '{print $4}')"

