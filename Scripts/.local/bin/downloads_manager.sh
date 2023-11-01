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
# TODO: handle errors somehow to and notify
download_url() {
	notify-send -u low -i /usr/share/icons/Qogir/32/status/system-save-session.svg \
		"downloading the $1 at $2"

	case "$1" in
		"Video")
			"$TERMINAL" yt-dlp --embed-thumbnail --embed-metadata --embed-chapters -P home:~/Videos -f 22 "$2"
			;;
		"Audio")
			"$TERMINAL" yt-dlp --embed-thumbnail --embed-metadata --embed-chapters -P home:~/Music -f 140 "$2"
			;;
		"Picture")
			"$TERMINAL" gallery-dl "$2"
			;;
		"Pixeldrain")
			link="$(printf "%s" "$2" | sed 's#.*/u/##')"
			"$TERMINAL" aria2c --check-integrity=true -d ~/File/Homework/H-Games/ "$(printf "https://pixeldrain.com/api/file/%s?download" "$link")"
			;;
		"General")
			"$TERMINAL" aria2c --check-integrity=true -d ~/Downloads "$2"
			;;
	esac

	notify-send -u low -i /usr/share/icons/Qogir/32/status/security-high.svg \
		"Done Downloading the $1 at $2"
}
# TODO: this should return the type only rather then call the function download_url itself
parse_url() {
	case "$1" in
		*.mkv | \
			*.mp4 | \
			*.webm | \
			*'youtube.com/watch'* | \
			*'youtube.com/playlist'* | \
			*'youtube.com/shorts'* | \
			*'youtu.be'*)
			download_url "Video" "$1"
			;;

		*.mp3 | \
			*.ogg | \
			*.flac | \
			*.opus)
			download_url "Audio" "$1"
			;;

		*'twitter.com'* | \
			*'mangasee'* | \
			*'tumblr'*)
			download_url "Picture" "$1"
			;;

		*'pixeldrain'*)
			download_url "Pixeldrain" "$1"
			;;

		*)
			download_url "General" "$1"
			;;
	esac
}

parse_url "$url"
