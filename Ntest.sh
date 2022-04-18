#!/bin/bash

# u need nmap to run this script

clear
if grep -q "nmap" ~/.bash_history; then
sleep 1
echo "it seems you have nmap installed..."
sleep 1
clear
else
sleep 1
echo -n "it seems you do not have nmap installed, do you want to install it?(Y or n): "
read yorn
if [[ "$yorn" == "Y" ]]; then
sudo apt install nmap
elif [[ "$yorn" == "y" ]]; then
sudo apt install nmap
elif [[ "$yorn" == "N" ]]; then
echo "cant run this script..."
exit
elif [[ "$yorn" == "n" ]]; then
echo "cant run this script..."
exit
else
echo "options: Y|y|N|n"
exit
fi

echo "Ntest"|figlet
sleep 1
echo ""
read -p "input your scan mode(s): " $SCANMODES

sleep 1
echo ""
read -p "input a ip or ip range: " $IPR
echo ""
echo "running commands"
sleep 1
clear

sudo nmap $SCANMODES $IPR

# just a update
