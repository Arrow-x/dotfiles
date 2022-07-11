#! /bin/sh

# TODO figure out how to do line breaks (and some color) in the notification message
# TODO check if any the fields are nill
cmus_query="$(cmus-remote --query)"

title="$(echo "$cmus_query" | grep "title" | sed "s/tag title //g")"
artist="$(echo "$cmus_query" | grep "tag \bartist" | sed "s/tag artist //g")"
album="$(echo "$cmus_query" | grep "album\b" | sed 's/tag album //g')"

rm ~/.cache/cover.jpg

echo "$cmus_query" | grep "file" | sed "s/file //g" | sed 's/\"/\\"/g' | sed 's/$/\"/;s/^/"/g' | xargs -I {} ffmpegthumbnailer -i "{}" -o ~/.cache/cover.jpg 
notify-send -u low --icon=~/.cache/cover.jpg "$title" "by: $artist from: $album"
