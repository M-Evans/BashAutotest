#/bin/bash

# How to use:
# 
# $0 pathToTestFile
#

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


CUR_PID=$$


getSecond() {
  echo $2
}


# TODO: implement pausing
yieldLines() {
  while read p
  do # $p is the line
    # TODO: command line arg:
    usleep 100000


    # debug:
    #echo >&2
    #ps --ppid $CUR_PID >&2
    #ps --ppid $CUR_PID | awk 'NR==3 { print $1 }' >&2
    #ps --ppid $(ps --ppid $CUR_PID | awk 'NR==3 { print $1 }') >&2


    if ps --ppid $(ps --ppid $CUR_PID | awk 'NR==3 { print $1 }') >/dev/null
    then  # there is a subprocess in the test cases
      echo ${p} >/proc/$CUR_PID/fd/1
    fi
    echo ${p} # goes to stdin
  done < $TEST_CASE_FILE
}


echo ================================================================================
yieldLines | bash -i
echo ================================================================================


