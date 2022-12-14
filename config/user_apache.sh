#!/bin/bash

debug() {
  echo
  echo "----------------------------------------------"
  echo $1
  echo "----------------------------------------------"
}

if [[ -z $1 && -z $2 ]]; then
    debug "Error: Need the name & password."
  exit 1
fi

tmp=$(ls -la /etc/apache2/.htpasswd 2> /dev/null)

if [[ -z $tmp ]]; then
  sudo htpasswd -c -b /etc/apache2/.htpasswd $1 $2
else
  sudo htpasswd -b /etc/apache2/.htpasswd $1 $2
fi

service apache2 restart
