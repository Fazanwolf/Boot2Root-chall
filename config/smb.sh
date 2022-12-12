#!/bin/bash

debug() {
  echo
  echo "----------------------------------------------"
  echo $1
  echo "----------------------------------------------"
}

sudo apt install -y samba
service smbd start
sudo ufw allow 'Samba'

sudo cp /etc/samba/smb.conf{,.backup} 

sudo mkdir /samba

sudo chgrp sambashare /samba 
