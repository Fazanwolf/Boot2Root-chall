#!/bin/bash

debug() {
  echo
  echo "----------------------------------------------"
  echo $1
  echo "----------------------------------------------"
}

if [[ -z $1 || -z $2 ]]; then
  echo "Error: need an username and file/folder file."
  exit 1
fi

sudo apt install -y vsftpd ftp
service vsftpd start
sudo ufw allow 21/tcp

sudo useradd $1
sudo mkdir -p /var/ftp/pub
sudo chown nobody:nogroup /var/ftp/pub

sudo cp /app/config/vsftpd.conf /etc/

sudo cp -r $2 /var/ftp/pub

service vsftpd restart