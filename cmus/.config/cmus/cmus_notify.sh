#! /bin/sh

# TODO cash one call to cmus-remote and use that
# TODO figure out how to do line breaks (and some color) in the notification message
# TODO check if any the fields are nill

title="$(cmus-remote --query | grep "title" | sed "s/tag title //g")"
artist="$(cmus-remote --query | grep "tag \bartist" | sed "s/tag artist //g")"
album="$(cmus-remote --query | grep "album\b" | sed 's/tag album //g')"

rm ~/.cache/cover.jpg

cmus-remote --query | grep "file" | sed "s/file //g" | sed 's/\"/\\"/g' | sed 's/$/\"/;s/^/"/g' | xargs -I {} ffmpegthumbnailer -i "{}" -o ~/.cache/cover.jpg 
notify-send -u low --icon=~/.cache/cover.jpg "$title" "by: $artist from: $album"
