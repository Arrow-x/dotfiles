#!/bin/sh

languages=$(echo "bash sh golang rust lua cpp c csharp python" | tr ' ' '\n')
core_utils=$(echo "xargs curl jq find mv sed awk printf" | tr ' ' '\n')
local_copy="$XDG_CACHE_HOME/cht_sh/"
selected=$(printf "%s\n%s" "$languages" "$core_utils" | fzf)

if [ -z "$selected" ]; then
	exit 1
fi

printf "Query: " >&2
read -r query

file="$local_copy""$selected"-"$query"

if printf "%s" "$languages" | grep -qs "$selected"; then
	curl -s cht.sh/"$selected"/"$query"> "$file"-new
else
	curl -s cht.sh/"$selected"~"$query"> "$file"-new
fi

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

bat "$file" --paging=always --plain
