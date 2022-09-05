#!/bin/bash
# Limoji dev

COL_NC='\e[0m' # No Color
COL_LIGHT_RED='\e[1;31m'
COL_LIGHT_GREEN='\e[1;32m'
COL_LIGHT_YELLOW='\e[1;93m'
TICK="${COL_NC}[${COL_LIGHT_GREEN}✓${COL_NC}]"
CROSS="${COL_NC}[${COL_LIGHT_RED}✗${COL_NC}]"
INFO="${COL_NC}[${COL_LIGHT_YELLOW}i${COL_NC}]"

# A function that copies the selected emoticon to the clipboard
# Works on both X11 and Wayland
copyToClipboard() {
    if [ $XDG_SESSION_TYPE == "x11" ]; then
        xclip -selection c
    else
        wl-copy
    fi
}

# Function that picks a random emoticon name
fetchRandomName() {
    # Generate a random number between 1 and ascii line count
    randomLine=$(( 1 + $RANDOM % $(wc -l ascii | awk '{print $1}') ))

    # Fetch emoticon's name from the selected line
    randomName=$(head -$randomLine ascii | tail +$randomLine | cut -d= -f1)
}

# Disable globbing
set -f

# Fetch all emoticons from the file
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

# Detect number of arguments
if [ $# == 1 ]; then
    if [ $1 == --emoticons ]; then
        echo -e "$(cat ascii)"
    elif [ $1 == --random ]; then
        # Picks a random emoticon name
        fetchRandomName

        # Rerun the function if randomName contains a non-alphabetical character
        while [[ "${randomName}" =~ [^a-zA-Z] ]]; do
            fetchRandomName
        done

        # Finally print the emoticon and copy it to the clipboard
        printf  "%b %b$randomName Was Copied To Clipboard Successfully:%b\\n" "${TICK}" "${COL_LIGHT_GREEN}" "${COL_NC}"
        echo -e ${!randomName} | tee >(copyToClipboard)
    else
        # Check if the selected emoticon exists
        if ! test -z "${!1}"; then
            printf  "%b %b$1 Was Copied To Clipboard Successfully:%b\\n" "${TICK}" "${COL_LIGHT_GREEN}" "${COL_NC}"
            echo -e ${!1} | tee >(copyToClipboard)
        else
            printf "%b %bThe specified emoji doesn't exist!%b\\n" "${CROSS}" "${COL_LIGHT_RED}" "${COL_NC}"
            printf "Try 'limoji --emoticons' for a list of available emojis.\n"
        fi
    fi
else
    printf "%b %bInvalid argument!%b\\n" "${CROSS}" "${COL_LIGHT_RED}" "${COL_NC}"
    printf "Try 'limoji --help' for a list of available commands.\n"
fi

# Enable globbing
set -f
