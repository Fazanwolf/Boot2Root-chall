#!/bin/bash

debug() {
  echo
  echo "----------------------------------------------"
  echo $1
  echo "----------------------------------------------"
}

allow_override() {
  echo
  echo "----------------------------------------------"
  echo "AllowOverride"
  echo "----------------------------------------------"
  echo
  echo "Before:"
  cat /etc/apache2/apache2.conf | tr '\n' '|' > /tmp/apache2.conf
  search='<Directory \/var\/www\/>|	Options Indexes FollowSymLinks|	AllowOverride None|	Require all granted|<\/Directory>'
  replace='<Directory \/var\/www\/>|	Options Indexes FollowSymLinks|	AllowOverride all|	Require all granted|<\/Directory>'
  sed -i "s/$search/$replace/" /tmp/apache2.conf
  cat apache2.conf.cpy.tmp | tr '|' '\n' > /etc/apache2/apache2.conf
  rm -rf /tmp/apache2.conf
}

if [[ -z $1 ]]; then
  debug "Error: Need the name of the directory."
  exit 1
fi

sudo ufw allow "Apache"

service apache2 start

sudo cp -rf $1 /var/www/

if [[ ! -z $2 && ! -z $3 ]]; then
  sudo cp -f $2 /etc/apache2/apache2.conf
  sudo cp -f $3 /etc/apache2/sites-available/000-default.conf
fi

a2enmod authz_groupfile

service apache2 restart

if [[ ! -z $4 && ! -z $5 ]]; then
  sudo cp $4 $5
fi

service apache2 reload
