#!/bin/bash
LOGFILE="$HOME/Desktop/syslog.txt"
echo "Time: $(date)" >> $LOGFILE
free -h | awk '/Mem:/ {print "Memory Used: "$3 " of "$2}' >> $LOGFILE
df -h / | awk 'NR==2 {print "Disk Used: "$3 " of "$2}' >> $LOGFILE
echo "-----------------------------" >> $LOGFILE
