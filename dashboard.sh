#!/bin/bash
# Smart Server Automation Dashboard with Logging

# Log file location
LOGFILE="$HOME/server_dashboard.log"

# Colors for terminal output
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
NC="\033[0m" # No Color

# Function to print and log simultaneously
log() {
    echo -e "$1" | tee -a "$LOGFILE"
}

log "${BLUE}===== SERVER DASHBOARD =====${NC}"
log "Date & Time: $(date)"
log "User: $USER"
log "Hostname: $HOSTNAME"
log "Shell: $SHELL"
log "Current Directory: $PWD"

log "${YELLOW}--- System Usage ---${NC}"
cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
log "CPU Usage: ${cpu}%"

mem=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')
log "Memory Usage: ${mem}%"

disk=$(df -h / | awk 'NR==2 {print $5}')
log "Disk Usage: $disk"

log "${YELLOW}--- Services Status ---${NC}"
services=("nginx" "mysql" "docker")

for service in "${services[@]}"; do
    systemctl is-active --quiet $service
    if [ $? -eq 0 ]; then
        log "$service: ${GREEN}Running${NC}"
    else
        log "$service: ${RED}Stopped${NC} (Attempting restart...)"
        sudo systemctl restart $service
        if [ $? -eq 0 ]; then
            log "$service: ${GREEN}Restarted Successfully${NC}"
        else
            log "$service: ${RED}Failed to Restart${NC}"
        fi
    fi
done

log "${BLUE}===== DASHBOARD END =====${NC}"
log "------------------------------------------------------"
