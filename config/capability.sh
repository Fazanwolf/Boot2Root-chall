#!/bin/bash

debug() {
  echo
  echo "----------------------------------------------"
  echo $1
  echo "----------------------------------------------"
}

if [[ -z $1 || -z $2 ]]; then
  echo "Error: need a capabilities (cap1,cap2,...) and a binary."
  exit 1
fi

sudo setcap $1 $2