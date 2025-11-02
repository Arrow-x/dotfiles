#!/bin/sh

selected=$(printf "\tLogout\n \tSuspend\n \tReboot\n \tShutdown" | fuzzel --dmenu | awk '{print tolower($2)}')

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
