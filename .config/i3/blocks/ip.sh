color=$(cat ~/.config/i3/blocks/color.i3blocks)
label="<span color='$color'><span font='FontAwesome'></span></span>"
#label="IP:"
case "$BLOCK_BUTTON" in
    1) ip="$(curl http://ifconfig.co)";;
    *) ip="$(/usr/lib/i3blocks/iface | head -n1)" ;;
esac

echo $label $ip
echo "label two"
echo $color
