#!/bin/bash

username="jean-test"
password="Boc0up"
perms="ALL=(ALL) NOPASSWD:/usr/bin/tar"

userFlag="EPI{Al3dM1ch3l}"
rootFlag="EPI{Fr0l9HELPH31P}"

sudo ufw enable

./config/ssh.sh
./config/apache.sh "html"

./config/rootFlag.sh "$rootFlag"

./config/user.sh "$username" "$password" "$perms" "$password"

./config/userFlag.sh "$userFlag" "$username"

./config/cleaning.sh

## To keep the container running
while true; do sleep 1000; done