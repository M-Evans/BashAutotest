#!/bin/bash

# bash -i test
# Purpose:
# * Test wheter or not I need to do manual screen printing
#   for bash.

# Observations:
# * bash -i (v3.2.25(1)-release) prints a prompt for each
#   line of standard input, but not the standard input
#   itself.
#
# * bash -i (v4.2.53(1)-release) prints a prompt for each
#   line of standard input AS WELL AS the standard input
#   itself.
#
# Basically, if you run this and it looks terrible, you're
# using the wrong shell for this project. See bashi3.sh
# for info on how to fix it.


yieldLines() {
  for (( i = 20; i > 0; i-- ))
  do
    echo \# $i
    usleep 150000
  done
  echo "# if you can see the numbers,"
  echo "# the script will work! "
}


echo ================================================================================
yieldLines | bash -i
echo ================================================================================

