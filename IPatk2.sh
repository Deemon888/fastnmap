#!/bin/bash

# ima try to use this as a case command #

port=$3
target=$2

case $1 in
        S)
                figlet "SILeNT"|lolcat -S 55
                sleep 2
                clear
                if [[ -z $port ]]; then
                        sudo nmap -sS -d $target
                else
                        sudo nmap -p $port -sS -d $target
                fi
                ;;
        vuln)
                figlet "VULN"|lolcat -S 83
                sleep 2
                clear
                if [[ -z $port ]]; then
                        sudo nmap --script vuln -d $target
                else
                        sudo nmap -p $port --script vuln -d $target
                fi
                ;;
        os)
                figlet "OS"|lolcat -F 10000000000 -S 83
                sleep 2
                clear
                if [[ -z $port ]]; then
                        sudo nmap -A -d $target
                else
                        sudo nmap -p $port -A -d $target

                        # i dont think anyone needs a port for a os scan... #
                fi
                ;;
        list)
                figlet "LIST"|lolcat -S 30
                sleep 2
                clear
                if [[ -z $port ]]; then
                        sudo nmap -sL $target
                else
                        sudo nmap -p $port -sL $target
                fi
                ;;
        *)
                echo -e """
usage1 : [mode] [target]
usage2 : [mode] [target] [port]

        # vv some modes vv #

        S    - silent
        vuln - vulnerabily check
        os   - os scan
        list - list ranges

u can see extra scan modes by using 'help'\a"""
                ;;
        help)
                echo -e """usage1 : [mode] [target]
usage2 : [mode] [target] [port]

        # vv some modes vv #

        S    - silent
        vuln - vulnerabily check
        os   - os scan
        list - list ranges"""
esac
