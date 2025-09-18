#!/bin/bash

THRESHOLD=80   # CPU usage limit (%)
INTERVAL=5     # Check every 5 seconds
LOGFILE="watchdog.log"

echo "🚨 Process Watchdog started (CPU > ${THRESHOLD}% will be killed)" | tee -a $LOGFILE
echo "Checking every ${INTERVAL} seconds..." | tee -a $LOGFILE
echo "----------------------------------------" | tee -a $LOGFILE

while true; do
    # Find processes above threshold
    ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | awk -v t=$THRESHOLD 'NR>1 && $4 > t {print $1, $3, $4}' | while read pid cmd cpu; do
        msg="⚠️ High CPU detected! PID=$pid CMD=$cmd CPU=$cpu%"
        echo "$msg" | tee -a $LOGFILE
        kill -9 $pid
        echo "✅ Process $pid ($cmd) killed at $(date)" | tee -a $LOGFILE
    done
    sleep $INTERVAL
done
