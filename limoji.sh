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

if [ $# == 1 ]; then
    if ! test -z "${!1}"; then
        echo ${!1} | tee >(copyToClipboard)
    else
        echo error doesnt exist
    fi
fi
