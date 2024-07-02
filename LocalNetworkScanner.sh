#!/bin/bash

#clean
rm -rf NetworkIPs.txt

# OCTET=$(ifconfig | grep "broadcast" | cut -d " " -f 10 | cut -d "." -f 1,2,3)
OCTET="192.168.1"
# echo $OCTET

#create file
touch NetworkIPs.txt

for IP in {1..254}
do
        ping -c 1 $OCTET.$IP | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" >> NetworkIPs.txt &
done

#sort IPs
sort NetworkIPs.txt

#scan
nmap -sS -iL NetworkIPs.txt