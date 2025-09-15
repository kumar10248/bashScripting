#!/bin/bash

# read -p "Enter user name: " username
# read -p "Enter remote host (IP/Hostname): " remote_host

username=$1
remote_host=$2

ssh $username@$remote_host
