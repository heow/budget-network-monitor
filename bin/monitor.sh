#!/bin/bash

LOG="log/monitor.log"
MAC="04:42:1A:09:4A:A5"

if [ -d "log" ]; then
    echo "logging to $LOG"
else
    echo "log directory not found"
    exit 1
fi

# warm up sudo
sudo ls ./log

# take a 10 second sample every minute
while true; do
    echo -n "$(date '+%Y-%m-%d %H:%M:%S') " | tee -a $LOG
    timeout 10 sudo tcpdump -i wlp1s0 ether host $MAC 2>&1 | grep captured | tee -a $LOG
    sleep 50
done

exit

# TODO
# split it into days
awk -F '\ ' '{print > "log-" $1 ".txt"}' sample1.log

# count the minutes per day
grep -v " 0 packets" log-2025-01-22.txt | wc -l

# do not exceed 300 minutes
