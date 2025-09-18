#!/bin/bash
clear

# Function: Slow typing effect
type_effect() {
    text="$1"
    delay="${2:-0.03}"
    for (( i=0; i<${#text}; i++ )); do
        echo -n "${text:$i:1}"
        play -q -n synth 0.01 sine 800 2>/dev/null &
        sleep $delay
    done
    echo
}

# Hacker intro
figlet "Kumar Devashish" | lolcat
type_effect "🔥 Ultimate Linux Flex Mode Activated 🔥" 0.05
sleep 1

# System Info
type_effect "[*] Gathering System Info..." 0.05
neofetch --ascii_distro ubuntu
sleep 1

# Matrix Mode
type_effect "[*] Initializing Matrix Rain..." 0.05
cmatrix -C green -u 4 -B &
MATRIX_PID=$!
sleep 5
kill $MATRIX_PID

# Fake Scan
type_effect "[*] Running Deep Scan on google.com..." 0.05
nmap -A google.com | lolcat

# The End
type_effect "[*] Flex Mode Complete ✅" 0.05
#!/bin/bash
clear
figlet "Kumar Devashish" | lolcat
echo "🔥 Ultimate Linux Flex Mode 🔥" | lolcat
sleep 1

echo "[*] System Info Loading..." | lolcat
neofetch --ascii_distro ubuntu

echo "[*] Matrix Mode On..." | lolcat
cmatrix -C green -u 4 -B &
MATRIX_PID=$!
sleep 5
kill $MATRIX_PID

echo "[*] Running Fake Scan on google.com..." | lolcat
nmap -A google.com | lolcat

echo "[*] Flex Mode Complete ✅" | lolcat
