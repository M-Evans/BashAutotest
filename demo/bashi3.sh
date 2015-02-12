#!/bin/bash

# To run this test, you must be in the demo directory
# the "file" should already be included

# Fix Trial 2 (file 3 in bash -i series)
# Purpose:
# * Assuming bash is entirely unhelpful with relaying stdin,
#   find a way to fix it
# 
# Flaws:
# * After cursory tests, appears to work well
# 
# Conclusion:
# * If you're using bash v3.2.25(1)-release, use this
#   method


CMD_PID=$$

yieldLines() {
  while read p
  do # $p is the line
    usleep 100000
    echo ${p} >/proc/$CMD_PID/fd/1
    echo ${p}
  done < file
}


echo ================================================================================
yieldLines | bash -i
echo ================================================================================

