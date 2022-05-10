#!/bin/bash

nmapfile=/usr/bin/nmap
lolcatfile=/usr/local/bin/lolcat
autosudo=on

# vars ^^

if test -f $nmapfile; then
  echo -en "Hmmm\r"
  sleep 0.05
  echo -en "Hmmm . \r"
  sleep 0.05
  echo -en "Hmmm . .\r"
  sleep 0.05
  echo -en "Hmmm . . .\n"
  sleep 1
  echo "it seems like u dont have nmap installed, do you want to install it"
  sleep 0.05
  read -e -p "[Y|n]: " yn
  if [[ -z $yn || $yn == "Y" || $yn == "y" ]]; then
    sleep 0.50
    clear
    sudo apt install nmap -y
    sleep 1
  elif [[ $yn == "N" || $yn == "n" ]]; then
    echo "well...bye"
    sleep 1
    clear
    exit
  fi
fi

# ^^ the nmap file check ^^ #

clear
if test -f $lolcatfile; then
  clear
  figlet "PAMN"|lolcat -S 38
else
  clear
  figlet "PAMN"
fi

read -e -p "input scan modes > " sm
echo ""
read -e -p "input ip > " ip
sleep 1
clear

if [[ $autosudo == "on" ]]; then
  sudo nmap $sm $ip
else
  nmap $sm $ip
fi

# big update
# untested
