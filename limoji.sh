#!/bin/bash
# Limoji dev

copyToClipboard() {
    xclip -selection c
}

. ascii

if [ $XDG_SESSION_TYPE != "x11" ]; then
    echo not x11
fi

if hash xclip 2> /dev/null; then
    echo xclip installed
else
    echo xclip not installed
fi

echo ${!1} | tee >(copyToClipboard)
