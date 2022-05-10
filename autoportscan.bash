#!/bin/bash

file=ip.txt

# test file ^^

if [[ -z $1 ]]; then
        echo -e "usage : [port] [mode]\n\n      # vv modes vv #\n\n     S, s, si - silent\n     vuln - vulnerability scan\n     A, a - os scan"
        echo -e "       \n\n    # vv (default) ports vv # \n\n  22, ssh - ssh port\n    http, 80 - http\n       https, 443 - https\n"
        echo -e "       \n You can also set your ip for later (range to scan) by using 'set'\n"
fi

# if the user put nothing ^^^ or something then nothing

if [[ $1 == "set" ]]; then
        if [[ -z $2 ]]; then
                if test -f $file; then
                        rm $file
                fi
                read -e -p "input ip or range > " ip
                echo "$ip"|cut -d '' -f1 >> ip.txt
        else
                if test -f $file; then
                        rm $file
                fi
                echo "$2"|cut -d '' -f1 >> ip.txt
        fi
fi

# ip file make ^^^

ipR=$(cat ip.txt)

if [[ $1 == "ssh" || $1 == "22" ]]; then
        if [[ $2 == "S" || $2 == "s" || $2 == "si" || $2 == "silent" ]]; then
                clear
                sudo nmap -sS -p 22 -d $ipR
        elif [[ $2 == "vuln" ]]; then
                clear
                sudo nmap -p 22 --script vuln -d $ipR
        elif [[ $2 == "A" || $2 == "a" || $2 == "os" ]]; then
                clear
                sudo nmap -p 22 -A -d $ipR
        fi
elif [[ $1 == "http" || $1 == "80" ]]; then
        if [[ $2 == "S" || $2 == "s" || $2 == "si" || $2 == "silent" ]]; then
                clear
                sudo nmap -sS -p 80 -d $ipR
        elif [[ $2 == "vuln" ]]; then
                clear
                sudo nmap -p 80 --script vuln -d $ipR
        elif [[ $2 == "A" || $2 == "a" || $2 == "os" ]]; then
                clear
                sudo nmap -p 80 -A -d $ipR
        fi
elif [[ $1 == "https" || $1 == "443" ]]; then
        if [[ $2 == "S" || $2 == "s" || $2 == "si" || $2 == "silent" ]]; then
                clear
                sudo nmap -sS -p 443 -d $ipR
        elif [[ $2 == "vuln" ]]; then
                clear
                sudo nmap -p 80 --script vuln -d $ipR
        elif [[ $2 == "A" || $2 == "a" || $2 == "os" ]]; then
                clear
                sudo nmap -p 80 -A -d $ipR
        fi
else
        if [[ $2 == "S" || $2 == "s" || $2 == "si" || $2 == "silent" ]]; then
                clear
                sudo nmap -sS -p $1 -d $ipR
        elif [[ $2 == "vuln" ]]; then
                clear
                sudo nmap -p $1 --script vuln -d $ipR
        elif [[ $2 == "A" || $2 == "a" || $2 == "os" ]]; then
                clear
                sudo nmap -p $1 -A -d $ipR
        fi
fi
