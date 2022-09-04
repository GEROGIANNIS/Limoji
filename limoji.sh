#!/bin/bash
# Limoji dev

copyToClipboard() {
    xclip -selection c
}

. ascii

if [ $XDG_SESSION_TYPE != "x11" ]; then
    echo not x11
fi

if ! hash xclip 2> /dev/null; then
    echo xclip installed
fi

 if [ $# != 0 ]; then
     echo "  " $1 was successfully copied to clipboard:
    echo  -e "  " ${!1} | tee >(copyToClipboard)
 fi

#  if [ $1 == random ]; then
#       printf "gg\n"
#   fi
#  ↑
#  Random Number Gen Between Two Numbers "$ echo $(( $RANDOM % 50 + 1 ))"
