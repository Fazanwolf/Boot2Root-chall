#!/bin/bash

debug() {
  echo
  echo "----------------------------------------------"
  echo $1
  echo "----------------------------------------------"
}

if [[ -z $1 || -z $2 ]]; then
  debug "Error: need an username, a password."
  exit 1
fi

debug "Creating user"
useradd -m $1 # creates user with home directory
usermod --shell /bin/bash $1 # sets bash as shell for the user
echo -e "$2\n$2\n" | passwd $1 # set the password for the user



if [[ ! -z $3 ]]; then
  debug "Setting up Sudo Priviledge"
  echo $3 > /tmp/user.sh.log
  echo "$1     $3" >> /etc/sudoers
fi

if [[ ! -z $4 ]]; then
  debug "Setting up SSH"
  sudo -u $1 ssh-keygen -q -t rsa -f /home/$1/.ssh/id_rsa -N "$4"
  chown -R $1:$1 /home/$1/.ssh
fi