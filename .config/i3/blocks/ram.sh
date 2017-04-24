#!/bin/bash

COLOR="$(cat ~/.config/i3/blocks/color.i3blocks)"
#SYMBOL=""
SYMBOL=""

TOTAL=$(free -mh | grep "Mem:" | cut -c 16-19)
USED=$(free -mh | grep "Mem:" | cut -c 28-31)

echo "$SYMBOL  $USED/$TOTAL"
echo ""
echo "$COLOR"
