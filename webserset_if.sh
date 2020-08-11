#!/bin/bash

###Learning bash scripting###

# Defining variables

ARTI="https://www.tooplate.com/zip-templates/2106_soft_landing.zip"
DEST="/var/www/html/"
DIR="2106_soft_landing"

echo "we are setting up website from tooplate.com"

yum --help &>> /dev/null
if [ $? -eq 0 ]
then
  PACK="httpd wget unzip"
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

else
  
  PACK="apache2 wget unzip"
  #Installing Packages
  echo "Installing dependencies."
  #Sudo apt update
  sudo apt update 
  sudo apt install $PACK -y > /dev/null

  #Start & enable SVC
  echo "Start & enable apache SVC"
  sudo systemctl start apache2
  sudo systemctl enable apache2

  #Download artfact
  echo "Download and extract artifact"
  cd /tmp/
  wget $ARTI
  unzip -o $DIR.zip > /dev/null
  cp -r /tmp/$DIR/* /var/www/html

  #Bounce apache aftifact deployment
  echo "Restart apache2 SVC"
  sudo systemctl restart apache2

  #Removing stale data
  sudo rm -rf /tmp/$3*

  systemctl status apache2

fi
