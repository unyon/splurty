#!/usr/bin/env bash

ssh  -p 2222 -i ~/.vagrant.d/insecure_private_key localhost -l vagrant
if [[ $? -ne 0 ]]

then
  clear
  tput setaf 1
  tput bold
  echo "FATAL ERROR!"
  tput sgr0
  echo "I bet your vagrant environment isn't running!"
  echo "Maybe look here about how to start it"
  tput setaf 2
  echo "http://www.thefirehoseproject.com/cheat-sheets/vagrant-intro"
  tput sgr0
  echo
  echo
  echo
  echo
fi
