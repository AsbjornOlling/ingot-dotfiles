#!/bin/bash

SCHEME=$1

I3BLOCKS_HEADER=~/.config/i3/blocks/header.i3blocks
I3BLOCKS_BASE=~/.config/i3/blocks/base.i3blocks
I3BLOCKS_FINAL=~/.config/i3/blocks/i3blocks.conf

# These files only contain a single hex color
I3BLOCKS_LIGHT=~/.config/i3/blocks/light.i3blocks
I3BLOCKS_DARK=~/.config/i3/blocks/dark.i3blocks
I3BLOCKS_COLOR=~/.config/i3/blocks/color.i3blocks

I3_BASE=~/.config/i3/base.i3
I3_LIGHT=~/.config/i3/light.i3
I3_DARK=~/.config/i3/dark.i3
I3_FINAL=~/.config/i3/config

TERMITE_BASE=~/.config/termite/base.termite
TERMITE_LIGHT=~/.config/termite/light.termite 
TERMITE_DARK=~/.config/termite/dark.termite 
TERMITE_FINAL=~/.config/termite/config

ALBERT_LIGHT=~/.config/.light.albert
ALBERT_DARK=~/.config/.dark.albert
ALBERT_FINAL=~/.config/albert.conf

FIREFOX_LIGHT=~/.mozilla/firefox/2yvzr5eu.default/stylish.light
FIREFOX_DARK=~/.mozilla/firefox/2yvzr5eu.default/stylish.dark
FIREFOX_FINAL=~/.mozilla/firefox/2yvzr5eu.default/stylish.sqlite

GTK_BASE=~/.config/gtk-3.0/base.gtk3
GTK_LIGHT=~/.config/gtk-3.0/light.gtk3
GTK_DARK=~/.config/gtk-3.0/dark.gtk3
GTK_FINAL=~/.config/gtk-3.0/settings.ini

HOMEPAGE_LIGHT=~/.config/softgoogle/light.css
HOMEPAGE_DARK=~/.config/softgoogle/dark.css
HOMEPAGE_FINAL=~/.config/softgoogle/style.css

if [[ "$SCHEME" == "light" ]]; then
	echo "Switching to light theme..."

	#Sets wallpaper
	#Setting wallpaper
	feh --bg-tile ~/Pictures/wp_light.jpg

	#i3blocks, makes a single file by appending several files to the header.
	if [[ -f "$I3BLOCKS_HEADER" ]]; then
	       echo "Switching i3blocks scheme."
	       cat "$I3BLOCKS_HEADER" > "$I3BLOCKS_FINAL"
	       cat "$I3BLOCKS_BASE" >> "$I3BLOCKS_FINAL"
	       # and then the color file:
	       cat "$I3BLOCKS_LIGHT" > "$I3BLOCKS_COLOR"
	else
	       echo "Some i3blocks files are missing!"
	fi


	#i3, merges color with main config, reloads i3 config
	if [[ -f "$I3_BASE" ]] && [[ -f "$I3_LIGHT" ]]; then
	       echo "Switching i3 scheme."
	       cat "$I3_BASE" > "$I3_FINAL"
	       cat "$I3_LIGHT" >> "$I3_FINAL"
	       i3-msg reload
	else
	       echo "Some i3 files are missing!"
	fi

	#Termite, merges color to main config
	if [[ -f "$TERMITE_BASE" ]] && [[ -f "$TERMITE_LIGHT" ]]; then
	       echo "Switching termite scheme."
	       cat "$TERMITE_BASE" > "$TERMITE_FINAL"
	       cat "$TERMITE_LIGHT" >> "$TERMITE_FINAL"
	else
	       echo "Some termite files are missing!"
	fi

	#Albert, overwrites one config file and restarts albert
	if [[ -f $ALBERT_LIGHT ]]; then
		echo "Switching albert scheme."
		cat "$ALBERT_LIGHT" > "$ALBERT_FINAL"
		killall albert 
		albert & disown
	else
		echo "Albert light theme is missing!"
	fi

	#Firefox, replaces Stylish.sqlite database. DOESNT restart firefox.
	if [[ -f "$FIREFOX_LIGHT" ]]; then
	       echo "Switching firefox scheme."
	       cp "$FIREFOX_LIGHT" "$FIREFOX_FINAL"
	else
	       echo "Some firefox files are missing!"
	fi

	#GTK, merges color with main config
	if [[ -f "$GTK_BASE" ]] && [[ -f "$GTK_LIGHT" ]]; then
	       echo "Switching gtk scheme."
	       cat "$GTK_BASE" > "$GTK_FINAL"
	       cat "$GTK_LIGHT" >> "$GTK_FINAL"
	else
	       echo "Some gtk files are missing!"
	fi

	#Homepage css, replaces style.css
	if [[ -f "$HOMEPAGE_LIGHT" ]]; then
	       echo "Switching homepage scheme."
	       cp "$HOMEPAGE_LIGHT" "$HOMEPAGE_FINAL"
	else
	       echo "Some homepage files are missing!"
	fi

fi

if [[ "$SCHEME" == "dark" ]]; then
	echo "Switching to dark theme..."

	#Sets wallpaper
	echo "Setting wallpaper."
	feh --bg-tile ~/Pictures/wp_dark.jpg

	#i3blocks, makes a single file by appending several files to the header.
	if [[ -f "$I3BLOCKS_HEADER" ]]; then
	       echo "Switching i3blocks scheme."
	       cat "$I3BLOCKS_HEADER" > "$I3BLOCKS_FINAL"
	       cat "$I3BLOCKS_BASE" >> "$I3BLOCKS_FINAL"
	       cat "$I3BLOCKS_LIGHT" > "$I3BLOCKS_COLOR"
	else
	       echo "Some i3blocks files are missing!"
	fi

	#i3, merges color with main config, reloads i3 config
	if [[ -f "$I3_BASE" ]] && [[ -f "$I3_DARK" ]]; then
	       echo "Switching i3 scheme."
	       cat "$I3_BASE" > "$I3_FINAL"
	       cat "$I3_DARK" >> "$I3_FINAL"
	       i3-msg reload
	else
	       echo "Some i3 files are missing!"
	fi

	#Termite, merges color to main config
	if [[ -f "$TERMITE_BASE" ]] && [[ -f "$TERMITE_DARK" ]]; then
	       echo "Switching termite scheme."
	       cat "$TERMITE_BASE" > "$TERMITE_FINAL"
	       cat "$TERMITE_DARK" >> "$TERMITE_FINAL"
	else
	       echo "Some termite files are missing!"
	fi

	#Albert, overwrites one config file and restarts albert
	if [[ -f $ALBERT_DARK ]]; then
		echo "Switching albert scheme."
		cat "$ALBERT_DARK" > "$ALBERT_FINAL"
		killall albert 
		albert & disown
	else
		echo "Albert dark theme is missing"
	fi

	#Firefox, replaces Stylish.sqlite database. DOESNT restart firefox.
	if [[ -f "$FIREFOX_DARK" ]]; then
	       echo "Switching firefox scheme."
	       cp "$FIREFOX_DARK" "$FIREFOX_FINAL"
	else
	       echo "Some firefox files are missing!"
	fi

	#GTK, merges color with main config
	if [[ -f "$GTK_BASE" ]] && [[ -f "$GTK_DARK" ]]; then
	       echo "Switching GTK scheme."
	       cat "$GTK_BASE" > "$GTK_FINAL"
	       cat "$GTK_DARK" >> "$GTK_FINAL"
	else
	       echo "Some gtk files are missing!"
	fi

	#Homepage css, replaces style.css
	if [[ -f "$HOMEPAGE_DARK" ]]; then
	       echo "Switching homepage scheme."
	       cp "$HOMEPAGE_DARK" "$HOMEPAGE_FINAL"
	else
	       echo "Some homepage files are missing!"
	fi
fi
