#!/bin/bash

sudo ufw enable

./config/ssh.sh
./config/ftp.sh "Kin" "test.txt"
./config/smb.sh 

./config/user.sh "jean" "uwu" "ALL=(ALL) NOPASSWD:/bin/cat"
./config/user.sh "pierre" "papapierre" "ALL=(ALL) NOPASSWD:/bin/cat" "papapierre"
./config/apache.sh "html"