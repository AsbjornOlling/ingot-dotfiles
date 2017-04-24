#!/bin/bash
color="$(cat ~/.config/i3/blocks/color.i3blocks)"
label="<span color='$color'><span font='FontAwesome'></span></span>"
current="$(nmcli -f connection dev | sed '2q;d')"
echo $label $current
echo "label two"
echo $color

case $BLOCK_BUTTON in
    1) network="$(nmcli -f ssid dev wifi list | sed '1d'| rofi -dmenu)"
       nmcli dev wifi connect $network ;;
esac

