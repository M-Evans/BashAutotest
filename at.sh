#/bin/bash

# How to use:
# change TEST_CASE_FILE to be the relative path to your inputs
# change EXECUTABLE to be the relative path to your executable
# run it, and observe!
#
#
# Warning: Currently, if you want to generate a script,
# you'll have to specify that in your input file
# e.g. 
#
# script scriptName
# dostuffhere
# exit
#
# In short: wrap your code with script and exit. Also make sure
# anything you run during your script finishes!



# TODO: change to command line argument
TEST_CASE_FILE=tests/exampleInput

COMMAND_PID=$$


yieldLines() {
  while read p
  do # $p is the line
    usleep 100000
    echo "$p" # goes to stdin
  done < $TEST_CASE_FILE
}


echo ================================================================================
yieldLines | bash -i
echo ================================================================================



