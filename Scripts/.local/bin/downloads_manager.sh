#!/bin/sh
help="this is the help text"
case "$1" in
	-h | --help | '')
		printf "%s\n" "$help"
		exit 0 ;;
	*)
		url="$1" ;;
esac


case "$url" in
		*.mkv \
			| *.mp4 \
			| *.webm \
			| *'youtube.com/watch'* \
			| *'youtube.com/playlist'* \
			| *'youtube.com/shorts'* \
		| *'youtu.be'*)
		notify-send "downloading the Video  at $url"
		yt-dlp --embed-thumbnail --embed-metadata --embed-chapters -P home:~/Videos -f 22 "$url"
		notify-send "$url Download Video Done"
		;;
		*.mp3 \
			| *.ogg \
			| *.flac \
		| *.opus )
		notify-send "downloading the Audio  at $url"
		yt-dlp --embed-thumbnail --embed-metadata --embed-chapters -P home:~/Music -f 140 "$url"
		notify-send "$url Download Audio Done"
		;;
		*'twitter.com'* \
		| *'mangasee'*)
		notify-send "downloading the Picture at $url"
		gallery-dl "$url"
		notify-send "$url Download Picture Done"
		;;
	*)
		notify-send "downloading the bin at $url"
		aria2c --check-integrity=true -d ~/Downloads "$url"
		notify-send "$url Download Bin Done"
		;;
esac
