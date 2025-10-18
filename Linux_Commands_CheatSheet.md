# 🧠 Ultimate Linux Commands Cheat-Sheet (Developer Edition)

*(Curated for power users, DevOps learners, and system explorers)*  

---

## 🗂️ 1. File & Directory Management
| Command | Description | Example |
|----------|--------------|----------|
| `ls -la` | List files (detailed) | `ls -la /etc` |
| `cd` | Change directory | `cd /var/log` |
| `pwd` | Print current directory | `pwd` |
| `cp` | Copy file | `cp a.txt /tmp/` |
| `mv` | Move or rename file | `mv old new` |
| `rm` | Remove file | `rm -rf dir` |
| `mkdir` | Create directory | `mkdir backups` |
| `tree` | Directory tree view | `tree /etc` |
| `stat` | File metadata | `stat file.txt` |

---

## 📄 2. Viewing & Editing Text Files
| Command | Description | Example |
|----------|--------------|----------|
| `cat` | Display file contents | `cat file.txt` |
| `tac` | Reverse cat | `tac file.txt` |
| `less` | Scroll through file | `less logs.txt` |
| `head` | First lines | `head -n 20 file` |
| `tail -f` | Stream new lines | `tail -f /var/log/syslog` |
| `nano` / `vim` | Editors | `vim notes.sh` |

---

## 🧩 3. Text Processing Power Tools
| Command | Description | Example |
|----------|--------------|----------|
| `grep` | Search pattern | `grep "error" logs.txt` |
| `awk` | Extract/format data | `awk '{print $1,$3}' file` |
| `sed` | Stream edit | `sed 's/old/new/g' file` |
| `cut` | Cut columns | `cut -d',' -f1 file.csv` |
| `sort` | Sort lines | `sort users.txt` |
| `uniq -c` | Count unique | `sort file | uniq -c` |
| `wc -l` | Line count | `wc -l logs.txt` |

---

## 🔐 4. Permissions & Ownership
| Command | Description | Example |
|----------|--------------|----------|
| `chmod` | Change permissions | `chmod 755 script.sh` |
| `chown` | Change owner | `sudo chown user:group file` |
| `umask` | Default perms | `umask 022` |

---

## 🔎 5. Searching & Finding Files
| Command | Description | Example |
|----------|--------------|----------|
| `find` | Search files | `find /etc -name "*.conf"` |
| `locate` | Fast search | `locate passwd` |
| `which` | Path of command | `which python3` |
| `type` | Command type | `type cd` |

---

## ⚙️ 6. Processes & System Control
| Command | Description | Example |
|----------|--------------|----------|
| `ps aux` | Show processes | `ps aux | grep nginx` |
| `top` / `htop` / `btop` | Live process viewer | `btop` |
| `kill` | Kill process | `kill -9 PID` |
| `systemctl` | Manage services | `sudo systemctl restart ssh` |
| `journalctl` | View logs | `sudo journalctl -u ssh -n 50` |

---

## 🌐 7. Networking & Connectivity
| Command | Description | Example |
|----------|--------------|----------|
| `ping` | Test connection | `ping google.com` |
| `ip addr` | Show IPs | `ip addr show` |
| `ss -tuln` | Show ports | `ss -tuln` |
| `curl` | HTTP request | `curl ifconfig.me` |
| `scp` | Secure copy | `scp file user@host:/path/` |
| `rsync` | Fast sync | `rsync -avz src/ user@host:/dst/` |
| `ssh` | Secure shell | `ssh user@server` |

---

## 🧱 8. Package Management (Ubuntu/Debian)
| Command | Description | Example |
|----------|--------------|----------|
| `apt update` | Update repo | `sudo apt update` |
| `apt install` | Install package | `sudo apt install nginx` |
| `dpkg -l` | List packages | `dpkg -l | grep python` |

---

## 💾 9. Disk & File Systems
| Command | Description | Example |
|----------|--------------|----------|
| `df -h` | Disk usage | `df -h` |
| `du -sh *` | Dir sizes | `du -sh *` |
| `lsblk` | Block devices | `lsblk` |
| `mount` / `umount` | Mount disks | `sudo mount /dev/sda1 /mnt` |

---

## 📦 10. Compression & Archiving
| Command | Description | Example |
|----------|--------------|----------|
| `tar czf` | Create archive | `tar czf backup.tar.gz dir/` |
| `zip` / `unzip` | Zip files | `zip -r site.zip site/` |
| `gzip` / `gunzip` | Compress/uncompress | `gzip file.txt` |

---

## 👤 11. Users & Groups
| Command | Description | Example |
|----------|--------------|----------|
| `adduser` | Create user | `sudo adduser devashish` |
| `passwd` | Change password | `passwd` |
| `usermod` | Modify user | `sudo usermod -aG sudo devashish` |
| `groups` | Show groups | `groups` |

---

## 🔒 12. Security & Hardening
| Command | Description | Example |
|----------|--------------|----------|
| `ufw` | Firewall | `sudo ufw allow 22` |
| `ssh-keygen` | Generate SSH key | `ssh-keygen -t rsa -b 4096` |
| `fail2ban` | Block brute-force | `sudo fail2ban-client status` |
| `chmod`, `chown` | Secure files | `chmod 600 ~/.ssh/id_rsa` |

---

## 🐋 13. Containers & DevOps
| Command | Description | Example |
|----------|--------------|----------|
| `docker ps` | Running containers | `docker ps -a` |
| `docker run` | Run image | `docker run -d -p 80:80 nginx` |
| `docker build` | Build image | `docker build -t myapp .` |
| `docker logs` | Logs | `docker logs container_id` |

---

## 🧠 14. Scripting & Automation
| Command | Description | Example |
|----------|--------------|----------|
| `bash script.sh` | Run script | `bash backup.sh` |
| `chmod +x` | Make executable | `chmod +x script.sh` |
| `crontab -e` | Schedule job | `0 2 * * * backup.sh` |
| `echo`, `read` | Input/output | `read name; echo "Hi $name"` |

---

## 🧮 15. Monitoring & Debugging
| Command | Description | Example |
|----------|--------------|----------|
| `free -h` | Memory | `free -h` |
| `uptime` | Load average | `uptime` |
| `dmesg` | Kernel logs | `dmesg | tail` |
| `lsof -i :8080` | Port usage | `lsof -i :8080` |
| `strace` | Syscalls trace | `strace -p PID` |

---

## ⚡ 16. Power One-Liners
```bash
# top 10 biggest files
du -ah / | sort -rh | head -n 10

# find files modified today
find / -type f -mtime -1

# monitor log updates
tail -f /var/log/syslog | grep ssh
```

---

## 🧭 17. Meta Commands
| Command | Description |
|----------|--------------|
| `man <cmd>` | Manual for command |
| `<cmd> --help` | Quick help |
| `history` | Show recent commands |
| `alias ll='ls -la'` | Create shortcuts |
