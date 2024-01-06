#!/bin/sh

# TODO a default icon when no album art
# TODO put all the tags possible in variables

cmus_query="$(cmus-remote --query)"

title="$(echo "$cmus_query" | grep "tag title" | sed "s/tag title //")"
artist="$(echo "$cmus_query" | grep "tag artist" | sed "s/tag artist //")"
album="$(echo "$cmus_query" | grep "tag album\b" | sed 's/tag album //')"

echo "$cmus_query" | grep "file" | sed "s/file //" | sed 's/"/\\"/g' | sed 's/$/"/;s/^/"/' | xargs -I {} ffmpegthumbnailer -i "{}" -o "$XDG_CACHE_HOME"/cmus_notification_cover.jpg

if [ -z "$artist" ]; then
	artist="Unknown"
fi

if [ -z "$album" ]; then
	album="Unknown"
fi

if [ -z "$title" ]; then
	title="$(echo "$cmus_query" | grep "file" | sed "s/file //" | sed 's/"/\\"/g' | sed 's/$/"/;s/^/"/' | xargs basename)"
fi

notify-send -u low --icon="$XDG_CACHE_HOME"/cmus_notification_cover.jpg "Now Playing:" "<b>$title</b>\nby: <b>$artist</b> from: <b>$album</b>"

rm "$XDG_CACHE_HOME"/cmus_notification_cover.jpg
