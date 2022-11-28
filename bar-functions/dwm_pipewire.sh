#!/bin/env sh


# Dependencies: wireplumber

dwm_pipewire () {
    VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | rg -o "[0-9].[0-9]+" )
    STATE=$( wpctl get-volume @DEFAULT_AUDIO_SINK@ | rg -o "MUTED")

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATE" = "MUTED" ] || [ $(echo "$VOL == 0.0 " | bc -l) -eq 1 ]; then
            printf "🔇"
        elif [ $( echo "$VOL > 0 && $VOL < .33" | bc -l ) -eq 1 ]; then
            printf "🔈 %s%%" "$VOL"
        elif [ $(echo "$VOL > .33 && $VOL < .66 "| bc -l) -eq 1 ]; then
            printf "🔉 %s%%" "$VOL"
        else
            printf "🔊 %s%%" "$VOL"
        fi
    else
        if [ "$STATE" = "MUTED" ] || [ $(echo "$VOL == 0.0 " | bc -l) -eq 1 ]; then
            printf "MUTED"
        else
            printf "VOL %s%%" "$VOL"
        fi
    fi
    printf "%s\n" "$SEP2"
}
