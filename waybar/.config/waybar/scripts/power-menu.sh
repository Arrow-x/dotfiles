#!/bin/sh

selected=$(printf "Logout\nSuspend\nReboot\nShutdown" | wofi --conf="$XDG_CONFIG_HOME"/wofi/config.power | awk '{print tolower($1)}')

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
