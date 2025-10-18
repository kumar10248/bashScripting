#!/bin/bash
msg=$(echo -e "System Report:\n$(uptime)\n$(free -h)\n$(df -h /)")
echo "$msg" | mail -s "Daily System Report" kumardevashish000@gmail.com
