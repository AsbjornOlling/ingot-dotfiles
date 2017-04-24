#! /bin/bash

# A script to handle brighness on my macbook air

set -e

BRIGHTNESS="/sys/class/backlight/intel_backlight/brightness"
BRIGHTNESS_VALUE="$(cat "$BRIGHTNESS")"
INCREMENT="100"

if [[ $1 == "up" ]]; then
	NEW_VALUE="$((BRIGHTNESS_VALUE + INCREMENT))"
elif [[ $1 == "down" ]]; then
	NEW_VALUE="$((BRIGHTNESS_VALUE - INCREMENT))"
fi


echo $BRIGHTNESS_VALUE
echo $NEW_VALUE

if [[ "$NEW_VALUE" -lt "$(cat /sys/class/backlight/intel_backlight/max_brightness)" ]]; then
	echo -e $NEW_VALUE | tee /sys/class/backlight/intel_backlight/brightness
#	sudo bash -c 'tee /sys/class/backlight/intel_backlight/brightness <<< $NEW_VALUE'
fi
	
