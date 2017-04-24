#!/bin/bash

COLOR="$(cat ~/.config/i3/blocks/color.i3blocks)"
SYMBOL=""
TEMP="$(sensors | grep Package | awk '{print substr($4,2);}')"
echo "$SYMBOL $TEMP"
echo ""
echo "$COLOR"
