#!/bin/bash

entries="English\nArabic"

selected=$(echo -e "$entries" | wofi --conf=$HOME/.config/wofi/config.lang)

case "$selected" in
  "English")
    swaymsg input type:keyboard xkb_switch_layout 0 >/dev/null; echo "  En";;
  "Arabic")
    swaymsg input type:keyboard xkb_switch_layout 1 >/dev/null; echo "  Ar";;
esac
