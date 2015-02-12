#!/bin/bash
# $1:   install dir
# $2:   src dir
# $3:   install name
# [$4]: cp flags (-f?)

if [ ! -e "src/$3" ]
then
  echo "Failure. Where did the executable go?"
  exit 1
fi

chmod +x "src/$3"
if [[ ! -e "$1/$3" || ! -z ${4} ]]
then
  cp ${4-} "src/$3" "$1/$3" >/dev/null 2>&1 && echo "Success" || { echo "Failure (can't write there?)"; exit 1; }
else
  echo "Failure (already exists?)"
  exit 1
fi

