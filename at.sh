#/bin/bash

# How to use:
# 
# $0 pathToTestFile
#
# Warning: Does not automatically generate a script.
# You'll have to specify that in your input file
# e.g. 
#
# script scriptName
# dostuffhere
#
# Note that you don't need to tell it to exit. When the
# testFile is done being read, it'll send the EOF char,
# which will stop the script automatically.


usage() {
  cat<<EOF
Usage: $0 pathToTestFile
EOF
}


# one argument
if [ $# != 1 ] 
then
  usage
  exit 1
fi

TEST_CASE_FILE=$1

# that argument must be a file
if [ ! -f $TEST_CASE_FILE ]
then
  echo "Error: $1 not a file"
  usage
  exit 1
fi


runningScripts=($(pidof script))
runningRshells=($(pidof rshell))


getSecond() {
  echo $2
}


yieldLines() {
  while read p
  do # $p is the line
    usleep 100000
    #bash -ic "read -p \"PAUSED\! \" var"
    if [ ! -z "$(pidof rshell)" ]
    then # rshell is running. Input doesn't naturally get printed
      echo ${p} > /proc/$(pidof rshell)/fd/1
    fi
    if [ ! -z "$(pidof script)" ]
    then
      echo ${p} > /proc/$(getSecond $(pidof script))/fd/0
    fi
    echo "$p" # goes to stdin
  done < $TEST_CASE_FILE
}


echo ================================================================================
yieldLines | bash -i
echo ================================================================================


