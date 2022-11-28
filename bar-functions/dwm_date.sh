#!/bin/sh

# A dwm_bar function that shows the current date and time
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_date () {
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "%s" "$(date "+%a,%d - %T")"
    else
        printf "%s" "$(date "+%a,%d-%m-%y %T")"
    fi
    printf "%s\n" "$SEP2"
}

dwm_date
