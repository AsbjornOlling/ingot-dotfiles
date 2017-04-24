color=$(cat ~/.config/i3/blocks/color.i3blocks)

case "$BLOCK_BUTTON" in
    1) label="<span color='$color'><span font='FontAwesome'></span></span>"
       dato=$(date '+%d-%m-%Y');; 
    *) label="<span color='$color'><span font='FontAwesome'></span></span>"
       dato=$(date '+%H:%M:%S');;
esac
echo $label $dato
echo "label two"
echo $color
