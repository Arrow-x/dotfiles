#!/bin/sh

if pidof -o %PPID -x "cht.sh" >/dev/null; then
	exit
fi

local_copy="$XDG_CACHE_HOME/cht_sh/"
mkdir -p "$local_copy"
file=""

make_local_copy() {
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
	exit 0
}

selected="$(curl -s cht.sh/:list | fzf --print-query | tail -1)"

if [ -z "$selected" ]; then
	exit 1
fi

selected=$(printf '%s' "$selected" | sed 's#/##g' | tr -d '\n')

if [ -n "$(printf '%s' "$selected" | grep "+")" ]; then
	file="$local_copy""$selected"
	curl -s cht.sh/"$selected" >"$file"-new
	make_local_copy
fi

query="$(curl -s cht.sh/"$selected"/:list | fzf)"

if [ -z "$query" ]; then
	file="$local_copy""$selected"
	curl -s cht.sh/"$selected" >"$file"-new
	make_local_copy
else
	file="$local_copy""$selected"-"$query"
	curl -s cht.sh/"$selected"/"$query" >"$file"-new
	make_local_copy
fi
