#!/bin/bash

debug() {
  echo
  echo "----------------------------------------------"
  echo $1
  echo "----------------------------------------------"
}

if [[ -z $1 || -z $2 ]]; then
  echo "Error: need a flag and an username."
  exit 1
fi

echo $1 > /home/$2/user.txt
chown $2:$2 /home/$2/user.txt