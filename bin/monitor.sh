#!/bin/bash
while true; do
    echo -n "$(date '+%Y-%m-%d %H:%M:%S') " | tee -a monitor.log
    timeout 10 tcpdump -i wlp1s0 ether host 04:42:1A:09:4A:A5 2>&1 | grep captured | tee -a monitor.log
    sleep 50
done

exit

# split it into days
awk -F '\ ' '{print > "log-" $1 ".txt"}' sample1.log

# count the minutes per day
grep -v " 0 packets" log-2025-01-22.txt | wc -l

# do not exceed 300 minutes
