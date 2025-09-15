#!/bin/bash

read -p "Enter IP address or hostname to ping: " target

ping -c3 -w6 $target