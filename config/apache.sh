#!/bin/bash

debug() {
  echo
  echo "----------------------------------------------"
  echo $1
  echo "----------------------------------------------"
}

if [[ -z $1 ]]; then
  debug "Error: Need the name of the directory."
  exit 1
fi

sudo apt install -y apache2
sudo ufw allow "Apache"

sudo cp -rf $1 /var/www/

service apache 2 start