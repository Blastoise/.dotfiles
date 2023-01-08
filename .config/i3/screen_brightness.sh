#!/bin/bash

function send_notification() {
	brightness=$(xbacklight -get | cut -d "." -f1)
	dunstify -a "ignore_hist" -u low -r "9995" -h int:value:"$brightness" "Brightness: ${brightness}%" -t 2000
}

case $1 in
up)
	xbacklight -inc 5
	send_notification
	;;
down)
	xbacklight -dec 5
	send_notification
	;;
mute)
	brightness=$(xbacklight -get | cut -d "." -f1)
	if [[ $brightness == 0 ]]; then
		xbacklight -set 20
		send_notification
	else
		xbacklight -set 0
	fi
	;;
esac
