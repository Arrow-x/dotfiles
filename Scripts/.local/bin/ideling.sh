#!/bin/sh
if [ -n "$(pgrep swayidle)" ]; then
	exit
fi

if [ "$XDG_CURRENT_DESKTOP" = "Hyprland" ]; then
	swayidle -w \
		timeout 300 '/home/arrowx/.config/sway/scripts/lock.sh' \
		timeout 700 'hyprctl dispatch dpms off' resume ' hyprctl dispatch dpms on' \
		timeout 1000 'systemctl suspend' resume 'swaymsg "output * power on"' \
		before-sleep '/home/arrowx/.config/sway/scripts/lock.sh' &

else
	swayidle -w \
		timeout 300 '/home/arrowx/.config/sway/scripts/lock.sh' \
		timeout 700 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
		timeout 1000 'systemctl suspend' resume 'swaymsg "output * power on"' \
		before-sleep '/home/arrowx/.config/sway/scripts/lock.sh' &
fi
