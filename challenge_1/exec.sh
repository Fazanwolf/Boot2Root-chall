#!/bin/bash

username="jean-test"
password="Boc0up"
perms="ALL=(ALL) NOPASSWD:/usr/bin/tar"

userFlag="EPI{Al3dM1ch3l}"
rootFlag="EPI{Fr0l9HELPH31P}"

sudo ufw enable

./config/ssh.sh

./config/rootFlag.sh "$rootFlag"

./config/user.sh "$username" "$password" "$perms" "$password"
./config/apache.sh apache/html apache/apache2.conf apache/000-default.conf apache/.htaccess /var/www/html/admin
./config/user_apache.sh "root" "root"

cp /home/$username/.ssh/id_rsa /var/www/html/admin/id_rsa
chown $username:$username /var/www/html/admin/id_rsa
chmod +r /var/www/html/admin/id_rsa

./config/apache_php.sh

./config/userFlag.sh "$userFlag" "$username"

./config/cleaning.sh

## To keep the container running
while true; do sleep 1000; done