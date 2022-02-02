#!/bin/bash

# this bash script is just for testing and for others to test and make better
# this will be nmap script for ethical hacking and scaning ips

echo "enter ip or listing ip"
read IP

echo "enter scan mode"
read SCANMODE

# by the way this is only a nmap basic scan script for a fun fast scan
# example : nmap -sL IP 
# SIMPLE RIGHT

# U need nmap for this script; run sudo apt install nmap

echo "do you want to run command: nmap $SCANMODE $IP (Y or n)"
read ANSWER

if [ "$ANSWER" != "${ANSWER#[Yy]}" ]; then
           echo "running command now"
           nmap $SCANMODE $IP
else
           echo "aborting"
           exit
fi

# like I says.............not advanced script
# finished in 10 mins
