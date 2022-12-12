#!/bin/bash

debug() {
  echo
  echo "----------------------------------------------"
  echo $1
  echo "----------------------------------------------"
}

if [[ -z $1 || -z $2 ]]; then
  debug "Error: need an username & a password."
  exit 1
fi

sudo useradd -M -d /samba/$1 -s /usr/sbin/nologin -G sambashare $1 
sudo mkdir /samba/$1
sudo chown $1:sambashare /samba/$1 
sudo chmod 2770 /samba/$1
echo -e "$2\n$2\n" | sudo smbpasswd -a $1
sudo smbpasswd -e josh