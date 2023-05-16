#!/bin/sh
destination="$HOME/Pictures/Bing/"
mkdir -p "$destination"
url="$(curl -s "https://bing.biturl.top/?resolution=1920&format=json&index=0&mkt=zh-CN" | jq '.url' | sed 's/\"//g')"
if [ -z "$url" ]; then
	exit 128
fi
file="$(echo "$destination""$(echo "$url" | awk -F "/" '{print $4}')")"
set_wallpaper() {
	nitrogen --set-auto --save "$file">/dev/null
}
if [ -f "$file" ]; then
	echo "file exist"
	set_wallpaper
	exit
fi
curl -s -o "$file" "$url"
set_wallpaper
