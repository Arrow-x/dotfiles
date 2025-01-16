#!/bin/sh
if [ "$XDG_CURRENT_DESKTOP" = "Hyprland" ]; then
	hyprlock
else
	PICTURE=/tmp/swaylock.png

	BLANK='#00000000'
	CLEAR='#ffffff22'
	DEFAULT='#ff00ffcc'
	TEXT='#ee00eeee'
	WRONG='#880000bb'
	VERIFYING='#bb00bbbb'
	BLUR="10"

	grim -s 0.3 $PICTURE
	magick "$PICTURE" -blur "$BLUR" "$PICTURE"

	if [ -n "$(pgrep swaylock)" ]; then
		exit
	fi
	# Locks the screen immediately
	swaylock -f --image "$PICTURE" \
		--inside-ver-color=$CLEAR \
		--ring-ver-color=$VERIFYING \
		\
		--inside-wrong-color=$CLEAR \
		--ring-wrong-color=$WRONG \
		\
		--inside-color=$BLANK \
		--ring-color=$DEFAULT \
		--line-color=$BLANK \
		--separator-color=$DEFAULT \
		\
		--text-ver-color=$TEXT \
		--text-wrong-color=$TEXT \
		--key-hl-color=$WRONG \
		--bs-hl-color=$WRONG

	rm "$PICTURE"
fi
