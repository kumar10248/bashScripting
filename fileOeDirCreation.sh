#!/bin/bash

read -rp "enter file name and extension name: " dir ext

for ((i=1; i<5; i++)); do
  if [ -d "devaBhai$i" ]; then
    touch "devaBhai$i/${dir}${i}.${ext}"
  else
    echo "Directory not found: devaBhai$i" >&2
  fi
done