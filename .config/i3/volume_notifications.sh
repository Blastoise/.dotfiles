#!/bin/bash

function send_notification() {
    volume=$(pactl get-sink-volume @DEFAULT_SINK@ | cut -d '/' -f2 | head -1 | grep -Eo "[0-9]*")
	dunstify -a "ignore_hist" -u low -r "9993" -h int:value:"$volume" -i "audio-volume-$1-symbolic.symbolic" "Volume: ${volume}%" -t 2000
}

case $1 in
up)
	# Set the volume on (if it was muted)
    pactl set-sink-mute @DEFAULT_SINK@ 0
    # Check so that volume does not go above 100%
    volume=$(pactl get-sink-volume @DEFAULT_SINK@ | cut -d '/' -f2 | head -1 | grep -Eo "[0-9]*")
    if ((volume <= 95)); then
        pactl set-sink-volume @DEFAULT_SINK@ +5%
    	send_notification "high"
    fi
	;;
down)
    pactl set-sink-mute @DEFAULT_SINK@ 0
    pactl set-sink-volume @DEFAULT_SINK@ -5%
	send_notification "low"
	;;
mute)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    if [[ $(pactl get-sink-mute @DEFAULT_SINK@ | cut -d " " -f2) == "yes" ]]; then 
        dunstify -i "audio-volume-muted-symbolic.symbolic" -a "ignore_hist" -t 2000 -r 9993 -u low "Muted"
    else
        send_notification "high"
    fi
	;;
esac
