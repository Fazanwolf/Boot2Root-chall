#!/bin/bash

debug() {
  echo
  echo "----------------------------------------------"
  echo $1
  echo "----------------------------------------------"
}

## Change all .bash_history to /dev/null
find / -name .bash_history -exec ln -fs /dev/null {} \; 2> /dev/null
