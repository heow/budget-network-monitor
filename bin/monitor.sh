#!/bin/bash

LAN="wlan0"

LOG="log/$(date '+%Y-%m-%d_network-monitor').log"

if [ -d "log" ]; then
    echo "logging to $LOG"
else
    echo "ERROR log directory not found"
    exit 1
fi

# MAC="04:42:1A:09:4A:A5"
if [ -z "$1" ]; then
    echo "ERROR MAC address missing"
    exit 1
else
    MAC="$1"
    echo "searching for MAC $MAC"
fi

# warm up sudo
echo "logs: "
sudo ls -1 ./log

# take a 10 second sample every minute
while true; do
    echo -n "$(date '+%Y-%m-%d %H:%M:%S') " | tee -a $LOG
    timeout 10 sudo tcpdump -i $LAN ether host $MAC 2>&1 | grep captured | tee -a $LOG
    sleep 50
done

exit 0

# TODO
# split it into days
awk -F '\ ' '{print > "log-" $1 ".txt"}' sample1.log

# count the minutes per day
grep -v " 0 packets" log-2025-01-22.txt | wc -l

# do not exceed 300 minutes
