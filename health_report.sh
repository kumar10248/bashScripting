#!/bin/bash

REPORT_FILE="/home/kumar/Desktop/bashScripting/health_report_$(date +%F).log"

{
    echo "========== System Health Report =========="
    echo "Date & Time : $(date)"
    echo "Uptime      : $(uptime -p)"
    echo "------------------------------------------"
    echo "Memory Usage:"
    free -h
    echo "------------------------------------------"
    echo "Disk Usage:"
    df -h /
    echo "------------------------------------------"
    echo "Top 5 Processes:"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
    echo "=========================================="
} > "$REPORT_FILE"
