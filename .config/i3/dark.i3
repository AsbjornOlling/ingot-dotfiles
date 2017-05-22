#Dark color scheme

set $inactive-bg-color   #1c2023
set $bg-color            #1c2023
set $text-color          #c7ccd1
set $inactive-text-color #747c84
set $urgent-bg-color     #c7ae95

# window colors
#                       border              background         text                 indicator
client.focused          $inactive-bg-color  $bg-color          $text-color          #2f343f
client.unfocused        $inactive-bg-color  $inactive-bg-color $inactive-text-color #2f343f
client.focused_inactive $inactive-bg-color  $inactive-bg-color $inactive-text-color #2f343f
client.urgent           $urgent-bg-color    $urgent-bg-color   $text-color          #2f343f

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
	position top
        status_command i3blocks -c ~/.config/i3/blocks/i3blocks.conf
        tray_output none
	font pango:xos4 Terminus 12px
        colors {
                background $inactive-bg-color
                separator #839496
                #                  border             background         text
                focused_workspace $text-color 	      $bg-color          $text-color
                inactive_workspace  $inactive-text-color        $bg-color        $inactive-text-color
                urgent_workspace   $urgent-bg-color   $urgent-bg-color   $text-color
        }
}

