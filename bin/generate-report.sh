#!/bin/bash
for file in "/home/pi/budget-network-monitor/log"/????-??-??*.log; do
    if [[ -f "$file" ]]; then
        line_count=$(grep -v " 0 packets" "$file"| wc -l )
        echo "$file: $line_count minutes"
    fi
done
