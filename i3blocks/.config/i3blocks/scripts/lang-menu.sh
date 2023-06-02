#!/bin/sh
selected=$(printf "English (US)\nArabic" | wofi --conf="$XDG_CONFIG_HOME"/wofi/config.lang)
case "$selected" in
	"English (US)")
		swaymsg input type:keyboard xkb_switch_layout 0 >/dev/null ;;
	"Arabic")
		swaymsg input type:keyboard xkb_switch_layout 1 >/dev/null ;;
esac
