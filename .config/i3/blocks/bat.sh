#!/bin/bash

BAT_100=""
BAT_75=""
BAT_50=""
BAT_25=""
BAT_0=""
CHARGING=""

GREEN="#95c7ae"
#GREEN="#aec795"
ORANGE="#c7ae95"
RED="#c795ae"
TEXT_COLOR="$(cat ~/.config/i3/blocks/color.i3blocks)"

PERCENT="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | grep -o '[0-9]\+')"
TEMPERATURE="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep temperature | cut -f14 -d " " )"
STATUS="$(cat /sys/class/power_supply/BAT0/status)"

TIME_LEFT="$(acpi -b | awk '{print substr($5,0)}')"
HOURS_LEFT="$(echo $TIME_LEFT | cut -f1 -d ':')"
MINUTES_LEFT="$(echo $TIME_LEFT | cut -f2 -d ':')"

# trigger notification if pushed
case "$BLOCK_BUTTON" in 
	1) twmnc -t " $STATUS" -c "$HOURS_LEFT hours, $MINUTES_LEFT minutes remaining. |   $TEMPERATURE °C";;
esac

## Set symbol and symbol color
if [[ "$STATUS" ==  "Charging" ]]; then
	SYMBOL=$CHARGING
	BAT_COLOR=$TEXT_COLOR
# Set full battery icon if closer to 100% than to 75%
elif [[ $PERCENT -gt 87 ]]; then
	SYMBOL=$BAT_100
	BAT_COLOR=$GREEN
# three quarters full if closer to 50 than to 75... and so on.
elif [[ $PERCENT -gt 62 ]]; then
	SYMBOL=$BAT_75
	BAT_COLOR=$GREEN
elif [[ $PERCENT -gt 37 ]]; then
	SYMBOL=$BAT_50
	BAT_COLOR=$GREEN
elif [[ $PERCENT -gt 12 ]]; then
	SYMBOL=$BAT_25
	BAT_COLOR=$ORANGE
else
	SYMBOL=$BAT_0
	BAT_COLOR=$RED
fi

echo "<span color='$BAT_COLOR'>$SYMBOL </span> $PERCENT%"
echo ""
echo "$TEXT_COLOR"
