#!/bin/bash

function send_notification() {
	volume=$(pamixer --get-volume)
	dunstify -a "ignore_hist" -u low -r "9993" -h int:value:"$volume" -i "audio-volume-$1-symbolic.symbolic" "Volume: ${volume}%" -t 2000
}

case $1 in
up)
	# Set the volume on (if it was muted)
	pamixer -u
	pamixer -i 5
	send_notification "high"
	;;
down)
	pamixer -u
	pamixer -d 5
	send_notification "low"
	;;
mute)
	pamixer -t
	if $(pamixer --get-mute); then
		dunstify -i "audio-volume-muted-symbolic.symbolic" -a "ignore_hist" -t 2000 -r 9993 -u low "Muted"
	else
		send_notification "high"
	fi
	;;
esac
