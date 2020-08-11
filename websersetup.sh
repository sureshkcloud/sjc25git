#!/bin/bash

###Learning bash scripting###

# Defining variables

read -p "Enter package name: " PACK
read -p "Enter Airtifict URL: " ARTI
read -p "Enter your Artifact DIR name: " DIR

echo "we are setting up website from tooplate.com"

rm -rf /var/www/html/*
#Installing Packages
echo "Installing dependencies."
#Sudo apt update
sudo yum install $PACK -y > /dev/null

#Start & enable SVC
echo "Start & enable apache SVC"
sudo systemctl start httpd
sudo systemctl enable httpd

#Download artfact
echo "Download and extract artifact"
cd /tmp/
wget $ARTI
unzip -o $DIR.zip > /dev/null
cp -r /tmp/$DIR/* /var/www/html

#Bounce apache aftifact deployment
echo "Restart apache2 SVC"
sudo systemctl restart httpd

#Removing stale data
sudo rm -rf /tmp/$3*

systemctl status httpd
