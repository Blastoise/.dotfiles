#!/bin/bash
device="ELAN1300:00 04F3:3057 Touchpad"
if [[ "$(xinput list-props "$device" | grep -P ".*Device Enabled.*\K.(?=$)" -o)" == "1" ]]
then
    xinput disable "$device"
    dunstify -a "ignore_hist" -u low -r "9994" -i "touchpad-disabled-symbolic.symbolic" "Touchpad Disabled" -t 2000
else
    xinput enable "$device"
    dunstify -a "ignore_hist" -u low -r "9994" -i "input-touchpad-symbolic.symbolic" "Touchpad Enabled" -t 2000
fi
