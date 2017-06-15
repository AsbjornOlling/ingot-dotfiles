#!/bin/bash

URL="intra.polydecibel.audio/files"
DEFAULT_COLOR=$(cat ~/.config/i3/blocks/color.i3blocks)

if pgrep -x "nextcloud" > /dev/null; then
	if curl --output /dev/null --silent --head --fail "$URL"; then
		#COLOR="#aec795"
		COLOR=$DEFAULT_COLOR
	fi
else
	COLOR="#c795ae"
fi

echo ""
echo "linetwo"
echo "$COLOR"
