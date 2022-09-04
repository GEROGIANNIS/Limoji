#!/bin/bash
# Limoji dev

#Color Palette
COL_NC='\e[0m' # No Color
COL_LIGHT_RED='\e[1;31m'
COL_LIGHT_GREEN='\e[1;32m'
COL_LIGHT_BLUE='\e[1;94m'
COL_LIGHT_YELLOW='\e[1;93m'
TICK="${COL_NC}[${COL_LIGHT_GREEN}✓${COL_NC}]"
CROSS="${COL_NC}[${COL_LIGHT_RED}✗${COL_NC}]"
INFO="${COL_NC}[${COL_LIGHT_YELLOW}i${COL_NC}]"
QUESTION="${COL_NC}[${COL_LIGHT_BLUE}?${COL_NC}]"

#Copy to clipboard function
copyToClipboard() {
    xclip -selection c
}
#Add ASCII File
. ascii

#Check If User Has X11
if [ $XDG_SESSION_TYPE != "x11" ]; then
    echo not x11
fi

#Check If xclip Is Installed
if ! hash xclip 2> /dev/null; then
    echo xclip installed
fi

#Print And Copy The Selected ASCII
 if [ $# != 0 ]; then
     echo "  " $1 was successfully copied to clipboard:
    echo  -e "  " ${!1} | tee >(copyToClipboard)
 fi
#  Test Code
#  if [ $1 == random ]; then
#       printf "gg\n"
#   fi
#  ↑
#  Random Number Gen Between Two Numbers "$ echo $(( $RANDOM % 50 + 1 ))"
