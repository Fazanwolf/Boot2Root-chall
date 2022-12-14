#!/bin/bash

debug() {
  echo
  echo "----------------------------------------------"
  echo $1
  echo "----------------------------------------------"
}

debug "Starting service - SSH"
service ssh start

debug "Port allowing: 22/tcp"
sudo ufw allow 22/tcp

debug "Setting up SSH"
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.factory-defaults
chmod a-w /etc/ssh/sshd_config.factory-defaults
service ssh restart
