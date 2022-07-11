#! /bin/sh

# TODO check if any the fields are nill
cmus_query="$(cmus-remote --query)"

title="$(echo "$cmus_query" | grep "title" | sed "s/tag title //g")"
artist="$(echo "$cmus_query" | grep "tag \bartist" | sed "s/tag artist //g")"
album="$(echo "$cmus_query" | grep "album\b" | sed 's/tag album //g')"

echo "$cmus_query" | grep "file" | sed "s/file //g" | sed 's/\"/\\"/g' | sed 's/$/\"/;s/^/"/g' | xargs -I {} ffmpegthumbnailer -i "{}" -o ~/.cache/cmus_notification_cover.jpg 
notify-send -u low --icon=~/.cache/cmus_notification_cover.jpg "Now Playing:" "<b>$title</b>\nby: <b>$artist</b> from: <b>$album</b>"

rm ~/.cache/cmus_notification_cover.jpg
