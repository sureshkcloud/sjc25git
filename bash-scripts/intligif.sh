#!/bin/bash

if [ $1 -lt 100 ]
then
  echo "We are entering IF Block"
  sleep 5
  echo "You have entered less then 100"
else
  echo "We are entering else BLOCK"
  SLEEP 5
  echo "YOU ARE ENTERED VALUE GREATER THEN 100"
fi

echo "Out of IF block"
