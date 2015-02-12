#!/bin/bash
# $1: install dir
# $2: install name

if [ -f "$1/$2" ]
then
  rm -f "$1/$2" >/dev/null 2>&1 && echo "Success!" || { echo "Failure (can't delete there?)"; exit 1; }
else
  echo "Failure (doesn't exist?)"
  exit 1
fi


