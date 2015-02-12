#/bin/bash

# To run this test, you must be in the demo directory
# and have a rshell binary there. 

# version 2:
# add a command to print what you're gonna do
# 
# flaws:
# * artifacts left in output
# * rshell must have the ';' operation implemented properly
#   before this works
# * 


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


