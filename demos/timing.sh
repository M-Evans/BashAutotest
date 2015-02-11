#!/bin/bash

# this demonstrates the yielding behavior needed
# I needed to be able to do something with text as WELL
# as to pass it into another program, both alternating
# at the same time

# the line retrieval will be functionalized
yield() {
  # infinite for testing purposes
  while [ 1 -lt 2 ]
  do
    # at this point I have the data I need. In this case,
    # "hi". I can do anything I want with it (more 
    # importantly put it anywhere I want), after
    # which I pass it to stdout
    echo hi
    # slow it down to see if I can do things synchronously
    sleep 1
  done
}

# the real test: will grep print out a "hi" every
# second, or wait for yield to stop yielding?
# Answer: data gets passed asap
yield | grep h



