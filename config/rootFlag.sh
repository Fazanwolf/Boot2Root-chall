#!/bin/bash

debug() {
  echo
  echo "----------------------------------------------"
  echo $1
  echo "----------------------------------------------"
}

if [[ -z $1 ]]; then
  echo "Error: need a flag."
  exit 1
fi

echo "$1" > /root/root.txt