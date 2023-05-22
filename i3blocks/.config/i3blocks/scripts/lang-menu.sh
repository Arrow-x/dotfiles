#!/bin/bash

entries="English (US)\nArabic"

selected=$(echo -e "$entries" | wofi --conf=$HOME/.config/wofi/config.lang)

case "$selected" in
  "English (US)")
    swaymsg input type:keyboard xkb_switch_layout 0 >/dev/null;;
  "Arabic")
    swaymsg input type:keyboard xkb_switch_layout 1 >/dev/null;;
esac
