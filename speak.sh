#!/bin/bash
msg="Hey $USER, it is $(date '+%A %H:%M:%S'). You have $(free -h | awk '/Mem:/ {print $3 " out of " $2}') of memory used. Disk space on root is $(df -h / | awk 'NR==2 {print $3 " of " $2}'). Warning: Chrome is eating your RAM again. Consider a coffee break."
echo "$msg"
echo "$msg" | festival --tts
