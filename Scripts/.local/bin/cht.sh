#!/bin/sh

if pidof -o %PPID -x "cht.sh" >/dev/null; then
	exit
fi

local_copy="$XDG_DATA_HOME/cht_sh/"
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
	bat --paging=always --style plain < "$file"
}

selected="$(curl -s cht.sh/:list | fzf --print-query | tail -1)"

if [ -z "$selected" ]; then
	exit 1
fi

selected=$(printf '%s' "$selected" | sed 's#/##g' | tr -d '\n')

if printf '%s' "$selected" | grep -q "+"; then
	file="$local_copy""$selected"
	curl -s cht.sh/"$selected" >"$file"-new
	make_local_copy
fi

pre_query="$(curl -s cht.sh/"$selected"/:list)"
query=""
if [ -n "$pre_query" ]; then
	query="$(printf '%s' "$pre_query" | fzf)"
fi

if [ -z "$query" ]; then
	file="$local_copy""$selected"
	curl -s cht.sh/"$selected" >"$file"-new
	make_local_copy
else
	file="$local_copy""$selected"-"$query"
	curl -s cht.sh/"$selected"/"$query" >"$file"-new
	make_local_copy
fi
