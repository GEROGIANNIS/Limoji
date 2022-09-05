#!/bin/bash
# Limoji dev

COL_NC='\e[0m' # No Color
COL_LIGHT_RED='\e[1;31m'
COL_LIGHT_GREEN='\e[1;32m'
COL_LIGHT_YELLOW='\e[1;93m'
TICK="${COL_NC}[${COL_LIGHT_GREEN}✓${COL_NC}]"
CROSS="${COL_NC}[${COL_LIGHT_RED}✗${COL_NC}]"
INFO="${COL_NC}[${COL_LIGHT_YELLOW}i${COL_NC}]"

copyToClipboard() {
    if [ $XDG_SESSION_TYPE == "x11" ]; then
        xclip -selection c
    else
        wl-copy
    fi
}

. ascii

# Check if current session is X11
if [ $XDG_SESSION_TYPE == "x11" ]; then
    # Verify xclip has been installed
    if ! hash xclip 2> /dev/null; then
        printf "%b %bX11 detected%b\\n" "${INFO}"
        printf "%b %bxclip is required for copying text to the clipboard%b\\n" "${CROSS}" "${COL_LIGHT_RED}" "${COL_NC}"
        exit 2
    fi
# Otherwise it is Wayland
else
    # Verify wl-clipboard has been installed
    if ! hash wl-copy 2> /dev/null; then
        printf "%b %bWayland detected%b\\n" "${INFO}"
        printf "%b %bwl-clipboard is required for copying text to the clipboard%b\\n" "${CROSS}" "${COL_LIGHT_RED}" "${COL_NC}"
        exit 2
    fi
fi

if [ $# == 1 ]; then
    if [ $1 == --emoticons ]; then
        cat ascii
    else
        if ! test -z "${!1}"; then
            echo ${!1} | tee >(copyToClipboard)
        else
            printf "%b %bThe specified emoji doesn't exist!%b\\n" "${CROSS}" "${COL_LIGHT_RED}" "${COL_NC}"
            printf "Try 'limoji --emoticons' for a list of available emojis.\n"
        fi
    fi
else
    printf "%b %bInvalid argument!%b\\n" "${CROSS}" "${COL_LIGHT_RED}" "${COL_NC}"
    printf "Try 'limoji --help' for a list of available commands.\n"
fi
