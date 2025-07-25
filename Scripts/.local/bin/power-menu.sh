#!/bin/sh

selected=$(printf " Logout\n Suspend\n Reboot\n Shutdown" | wofi --conf="$XDG_CONFIG_HOME"/wofi/config.power | awk '{print tolower($2)}')

case "$selected" in
logout)
	lock.sh
	if [ "$XDG_CURRENT_DESKTOP" = "Hyprland" ]; then
		hyprctl dispatch exit
	else
		swaymsg exit
	fi
	;;
suspend)
	systemctl suspend
	;;
reboot)
	systemctl reboot
	;;
shutdown)
	systemctl poweroff -i
	;;
esac
