>top5.log
while true; do
  clear
  echo "Top 5 Processes by CPU usage:"
  # Use top to get process info, filter with head and awk to format output
  top -b -n 1 | head -n 12 | tail -n 5 | tee -a top5.log #| awk '{printf "%-8s %-8s %-8s %-8s %-8s %-8s\n", $1, $2, $9, $10, $12, $NF}'
  sleep 5
done
