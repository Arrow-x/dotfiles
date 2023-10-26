#!/bin/sh
local_copy="$XDG_CACHE_HOME/cht_sh/"
mode="$(printf "Language\nCore-util" | fzf)"

if [ -z "$mode" ]; then
	exit
fi

case "$mode" in
	Language)
		printf "What Language: "
		;;
	"Core-util")
		printf "What Core-util: "
		;;
esac

read -r selected

if [ -z "$selected" ]; then
	exit 1
fi

printf "Query: "
read -r query

mkdir -p "$local_copy"
file="$local_copy""$selected"-"$query"

case "$mode" in
	Language)
		curl -s cht.sh/"$selected"/"$query" >"$file"-new
		;;
	"Core-util")
		curl -s cht.sh/"$selected"~"$query" >"$file"-new
		;;
esac

if [ -z "$(cat "$file"-new)" ]; then
	rm "$file"-new
	if [ ! -f "$file" ]; then
		exit 1
	fi
else
	if [ -f "$file" ]; then
		rm "$file"
	fi
	mv "$file"-new "$file"
fi

bat "$file" --paging=always --style plain
