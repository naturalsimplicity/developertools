#!/usr/bin/env bash



CPU_USAGE=$(top -bn1 | awk '/Cpu/ { print $2}')
echo "CPU usage: $CPU_USAGE"

MEM_USAGE=$(free -m | awk '/Mem/{print $3}')
echo "Memory usage: $MEMORY_USAGE MB"

DRIVE_USAGE=$((100-$(df -k . | awk '{ print $5 }' | tail -n 1 | tr -d '%')))
echo "Drive usage: $DRIVE_USAGE%"


SYS_TOTAL_MEM=$(($(awk '/MemTotal/ {print $2}' /proc/meminfo) / 1024))
MEM_THRESHOLD=80
if [ $MEMORY_USAGE -ge MEM_THRESHOLD * SYS_TOTAL_MEM ]; then
    echo "Memory usage exceeds $MEM_THRESHOLD%"  
fi;
