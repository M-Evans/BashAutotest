#!/bin/bash

# -i demo:
# * bash -i (v3.2.25(1)-release) prints a prompt for each
#   line of standard input, but not the standard input
#   itself.
# * bash -i (v


yieldLines() {
  for (( i = 20; i > 0; i-- ))
  do
    echo \# $i
    usleep 150000
  done
}


echo ================================================================================
yieldLines | bash -i
echo ================================================================================


