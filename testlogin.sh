#!/bin/bash

### Script to test login for SOSTSIP
USR=root

for IP in `cat HOSTSIP`

do
  echo "Trying Login to $IP"
  ssh -i webser-key.pem $USR@$IP hostname
  if [ $? -eq 0 ]
  then 
    echo "Login successful on $IP"
  else
    echo "Unsecessful login attempt"
    echo "Check your internet and firewall rules"
  fi
sleep 3
done
