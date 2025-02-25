#!/bin/sh

if [ -z "$(pgrep sway-audio-idle-inhibit)" ]; then
	setsid -f sway-audio-idle-inhibit
fi

if [ -n "$(pgrep swayidle)" ]; then
	notify-send "swayidle is already running"
	exit
fi


if [ "$XDG_CURRENT_DESKTOP" = "Hyprland" ]; then
	swayidle -w \
		timeout 300 "$HOME/.local/bin/lock.sh" \
		timeout 1000 "systemctl suspend"
else
	swayidle -w \
		timeout 300 "$HOME/.local/bin/lock.sh" \
		timeout 700 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
		timeout 1000 'systemctl suspend' resume 'swaymsg "output * power on"' \
		before-sleep "$HOME/.local/bin/lock.sh" &
fi
