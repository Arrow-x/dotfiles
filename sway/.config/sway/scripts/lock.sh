#!/bin/sh
if [ -n "$(pgrep swaylock)" ]; then
	exit
fi
PICTURE=/tmp/swaylock.png

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#ff00ffcc'
TEXT='#ee00eeee'
WRONG='#880000bb'
VERIFYING='#bb00bbbb'
BLUR="10"

grim -s 0.3 $PICTURE
convert "$PICTURE" -blur "$BLUR" "$PICTURE"
# Times the screen off and puts it to background
if [ -z "$(pgrep swayidle)" ]; then
	swayidle \
		timeout  300 'swaymsg "output * power off"' \
		resume 'swaymsg "output * power on"' &
fi
# Locks the screen immediately
swaylock -f --image "$PICTURE"\
	--inside-ver-color=$CLEAR     \
	--ring-ver-color=$VERIFYING   \
	\
	--inside-wrong-color=$CLEAR   \
	--ring-wrong-color=$WRONG     \
	\
	--inside-color=$BLANK        \
	--ring-color=$DEFAULT        \
	--line-color=$BLANK          \
	--separator-color=$DEFAULT   \
	\
	--text-ver-color=$TEXT          \
	--text-wrong-color=$TEXT          \
	--key-hl-color=$WRONG         \
	--bs-hl-color=$WRONG
# Kills last background task so idle timer doesn't keep running
rm "$PICTURE"
kill %%
