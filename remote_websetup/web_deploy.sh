#!/bin/bash

USR1=root
USR2=ubuntu
### script to setup webserver from tooplate.com to many ec2 machines and in its HOSTSIP file.

#push websetup.sh script to target machine
for IP in `cat HOSTSIP`
do
  echo "Pusiging websetup script to $IP"
  scp -i webser-key.pem webservsetup.sh $USR1@$IP:/tmp/
  scp -i webser-key.pem webservsetup.sh $USR2@$IP:/tmp/
done

# Execute websetup.sh script on machines
for IP in `cat HOSTSIP`
do
  echo "Ececuting websetup script to $IP"
  ssh -i webser-key.pem $USR1@$IP sudo /tmp/webservsetup.sh
  ssh -i webser-key.pem $USR2@$IP sudo /tmp/webservsetup.sh
done
