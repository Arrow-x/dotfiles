#!/bin/sh
help="this is the help text"
case "$1" in
	-h | --help | '')
		printf "%s\n" "$help"
		exit 0
		;;
	*)
		url="$1"
		;;
esac

case "$url" in
	*.mkv | \
		*.mp4 | \
		*.webm | \
		*'youtube.com/watch'* | \
		*'youtube.com/playlist'* | \
		*'youtube.com/shorts'* | \
		*'youtu.be'*)

		notify-send -u low -i /usr/share/icons/Qogir/32/status/system-save-session.svg \
			"downloading the Video  at $url"

		yt-dlp --embed-thumbnail --embed-metadata --embed-chapters -P home:~/Videos -f 22 "$url"

		notify-send -u low -i /usr/share/icons/Qogir/32/status/security-high.svg \
			"$url Download Video Done"
		;;

	*.mp3 | \
		*.ogg | \
		*.flac | \
		*.opus)
		notify-send -u low -i /usr/share/icons/Qogir/32/status/system-save-session.svg \
			"downloading the Audio  at $url"

		yt-dlp --embed-thumbnail --embed-metadata --embed-chapters -P home:~/Music -f 140 "$url"

		notify-send -u low -i /usr/share/icons/Qogir/32/status/security-high.svg \
			"$url Download Audio Done"
		;;

	*'twitter.com'* | \
		*'mangasee'* | \
		*'tumblr'*)
		notify-send -u low -i /usr/share/icons/Qogir/32/status/system-save-session.svg \
			"downloading the Picture at $url"

		gallery-dl "$url"

		notify-send -u low -i /usr/share/icons/Qogir/32/status/security-high.svg \
			"$url Download Picture Done"
		;;

	*'pixeldrain'*)
		notify-send -u low -i /usr/share/icons/Qogir/32/status/system-save-session.svg \
			"downloading the pixeldrain at $url"

		link="$(printf "%s" "$url" | sed 's#.*/u/##')"
		"$TERMINAL" aria2c --check-integrity=true -d ~/File/Homework/H-Games/ "$(printf "https://pixeldrain.com/api/file/%s?download" "$link")"

		notify-send -u low -i /usr/share/icons/Qogir/32/status/security-high.svg \
			"$url Download pixeldrain Done"
		;;

	*)
		notify-send -u low -i /usr/share/icons/Qogir/32/status/system-save-session.svg \
			"downloading the bin at $url"

		"$TERMINAL" aria2c --check-integrity=true -d ~/Downloads "$url"

		notify-send -u low -i /usr/share/icons/Qogir/32/status/security-high.svg \
			"$url Download Bin Done"
		;;
esac
