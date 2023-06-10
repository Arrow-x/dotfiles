#!/bin/sh

selected=$(printf " Logout\n Suspend\n Reboot\n Shutdown" | wofi --conf="$XDG_CONFIG_HOME"/wofi/config.power | awk '{print tolower($2)}')

case "$selected" in
	logout)
		swaymsg exit ;;
	suspend)
		exec systemctl suspend ;;
	reboot)
		exec systemctl reboot ;;
	shutdown)
		exec systemctl poweroff -i ;;
esac
