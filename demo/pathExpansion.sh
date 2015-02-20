#!/bin/bash

# Path File List Expansion Test
# Purpose:
# * Determine if an argument successfully expands to
#   contain one or more valid file paths

# Observations:
# * It's possible to get a space-separated list of
# filenames with a simple '$1*'

# Conclusion:
# * It's easiest to use a for loop to check all of the
#   names


for file in $1*
do
  if [[ -f $file ]]
  then
    echo "$file is a file"
  else
    echo "$file is not a file"
  fi
done



