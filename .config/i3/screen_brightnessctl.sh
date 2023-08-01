#!/bin/bash

function send_notification() {
    brightness=$(brightnessctl -m | cut -d "," -f4 | cut -d "%" -f1)
	dunstify -a "ignore_hist" -u low -r "9995" -h int:value:"$brightness" "Brightness: ${brightness}%" -t 2000
}

case $1 in
up)
	brightnessctl -q s +5%
	send_notification
	;;
down)
	brightnessctl -q s 5%-
	send_notification
	;;
mute)
    brightness=$(brightnessctl -m | cut -d "," -f4 | cut -d "%" -f1)
	if [[ $brightness == 0 ]]; then
		brightnessctl -q s 20%
		send_notification
	else
		brightnessctl -q s 0%
	fi
	;;
esac
