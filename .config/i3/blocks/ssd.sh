
COLOR=$(cat ~/.config/i3/blocks/color.i3blocks)
FREE=$(df -h /dev/sda2 | grep sda2 | awk '{print $2}')

echo "  $FREE"
echo "shit"
echo $COLOR
