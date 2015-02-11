#/bin/bash

# How to use:
# change TEST_CASE_FILE to be the relative path to your inputs
# change EXECUTABLE to be the relative path to your executable
# run it, and observe!
#
# Warning: Currently, if you want to generate a script,
# you'll have to specify that in your input file

# TODO: change to command line argument
TEST_CASE_FILE=externFile
# TODO: change to command line argument
EXECUTABLE="bash -i"

#TEMPDIR=$(mktemp -d)
COMMAND_PID=$$


yieldLines() {
  #usleep 100000 # wait for the command to startup and background
  #COMMAND_PID=$(cat $TEMPDIR/pid)
  while read p
  do # $p is the line
    usleep 100000
    echo "$p" > /proc/$COMMAND_PID/fd/0 # goes to the screen
    echo "$p" # goes to stdin

  done < $TEST_CASE_FILE
}


echo Starting
#sleep 1
#echo -n " 2" # backspace characters! :)
#sleep 1
#echo " 1" # backspace characters! :)
#sleep 1


echo ================================================================================
yieldLines | $EXECUTABLE
echo ================================================================================
#echo $! > $TEMPDIR/pid
#echo waiting...
#read p



