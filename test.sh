#!/bin/bash
# echo "Hello World"

# echo "Enter you name"
# read  name
# echo $name

# read -p "name & age" n a
# echo "name: $n age: $a"

# read -sp "enter password" ps

# echo -e "\npass: $ps"

# echo "Shell: $SHELL"
# echo "Date is: $(date)"

# echo "Shell: $USER"
# echo "Shell: $HOME"




# echo "===== User Info ====="
# echo "User: $USER"
# echo "User ID: $UID"
# echo "Home Directory: $HOME"
# echo "Login Name: $LOGNAME"

# echo -e "\n===== System Info ====="
# echo "Hostname: $HOSTNAME"
# echo "Operating System: $OSTYPE"
# echo "Machine Type: $MACHTYPE"
# echo "Shell: $SHELL"
# echo "Terminal: $TERM"

# echo -e "\n===== Path & Directories ====="
# echo "Current Dir (PWD): $PWD"
# echo "Previous Dir (OLDPWD): $OLDPWD"
# echo "PATH: $PATH"

# echo -e "\n===== History & Language ====="
# echo "History File: $HISTFILE"
# echo "History Size: $HISTSIZE"
# echo "Language: $LANG"

# echo -e "\n===== Process Info ====="
# echo "Current Script Name: $0"
# echo "Script Args Count: $#"
# echo "All Args: $@"
# echo "Script PID: $$"
# echo "Parent PID: $PPID"
# echo "Last Background PID: $!"
# echo "Exit Status of Last Command: $?"

# echo -e "\n===== SSH Info (if remote login) ====="
# echo "SSH Client: $SSH_CLIENT"
# echo "SSH TTY: $SSH_TTY"



# file=`cat<test.txt`

# echo $file

# read -p "Enter name and age: " name age

# echo "name: $name  ; age: $age" >> test.txt


# file=$(cat test.txt)
# echo "File contents: $file"


file=`cat>dashboard.sh`
echo $file