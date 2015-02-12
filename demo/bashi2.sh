#!/bin/bash

# To run this test, you must be in the demo directory
# the "file" should already be included

# Fix Trial 1 (file 2 in bash -i series)
# Purpose:
# * Assuming bash is entirely unhelpful with relaying stdin,
#   find a way to fix it
# 
# Flaws:
# * artifacts left in output by less intelligent
#   subshells (bash doesn't have this problem). Only
#   occurs when the commands run a subshell.
#
# * Any subshell being run must properly handle the ';'
#   command connector.
#
# * Executes an extra command for each command in the
#   test file
#
# Conclusion:
# * Don't use this method



yieldLines() {
  while read p
  do # $p is the line
    usleep 100000
    echo "echo '${p}' ; ${p}"
  done < file
}


echo ================================================================================
yieldLines | bash -i
echo ================================================================================

