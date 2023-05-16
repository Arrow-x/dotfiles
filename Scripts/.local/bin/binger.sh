#!/bin/sh
DESTINATION="$HOME/Pictures/Bing/"
mkdir -p "$DESTINATION"
URL="$(curl -s "https://bing.biturl.top/?resolution=1920&format=json&index=0&mkt=zh-CN" | jq '.url' | sed 's/\"//g')"
if [ -z "$URL" ]; then
	exit 128
fi
FILE="$(echo "$DESTINATION""$(echo "$URL" | awk -F "/" '{print $4}')")"
set_wallpaper() {
	nitrogen --set-auto --save "$FILE">/dev/null
}
if [ -f "$FILE" ]; then
	echo "file exist"
	set_wallpaper
	exit
fi
curl -s -o "$FILE" "$URL"
set_wallpaper
