#!/bin/bash
date
echo "Welcome user $(whoami) to $HOSTNAME" 
echo Free "root partition" $(df -Th | grep /dev/xvda2 | awk '{print $5}')
echo "Free Ram size MB" $(free --mega | grep Mem | awk '{print $4}')
echo $(uptime | awk '{print $6, $7, $8, $9, $10}')
