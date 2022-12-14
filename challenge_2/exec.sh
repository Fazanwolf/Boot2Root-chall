#!/bin/bash

username="jean-test"
password="Boc0up"
perms=""

userFlag="EPI{3241w1NeHEh}"
rootFlag="EPI{1mTiR3d0fTh4t}"

sudo ufw enable

./config/ssh.sh >> /app/log-ssh.txt

./config/rootFlag.sh "$rootFlag"

./config/user.sh "$username" "$password" "$perms" "$password"

./config/ftp.sh "$username" /home/$username/.ssh/id_rsa

./config/userFlag.sh "$userFlag" "$username"

./config/capabilities.sh "cap_net_raw,cap_net_admin" /usr/bin/nano
 
## Remove all traces of the setup
./config/cleaning.sh

## To keep the container running
while true; do sleep 1000; done