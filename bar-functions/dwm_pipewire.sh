#!/bin/env sh

# Dependencies: wireplumber

dwm_pipewire() {
	#VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | rg -o "[0-9].[0-9]+" )
	VOL=$(printf "%d" $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | rg -o "[0-9]"))
	STATE=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | rg -o "MUTED")

	printf "%s" "$SEP1"
	if [ "$IDENTIFIER" = "unicode" ]; then
		if [ "$STATE" = "MUTED" ] || [ $VOL -eq 0 ]; then
			printf "🔇"
		else
			VOL=${VOL##+(0)}
			if [ $VOL -gt 0 ] && [ 33 -gt $VOL ]; then
				printf "🔈 %s%%" "$VOL"
			elif [ $VOL -gt 33 ] && [ 66 -gt $VOL ]; then
				printf "🔉 %s%%" "$VOL"
			else
				printf "🔊 %s%%" "$VOL"
			fi
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
