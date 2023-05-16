#!/bin/sh
languages=$(echo "bash sh golang rust lua cpp c csharp python" | tr ' ' '\n')
core_utils=$(echo "xargs curl jq find mv sed awk" | tr ' ' '\n')
local_copy="/home/arrowx/.local/share/shiny-resources/cht_sh/"
selected=$(printf "$languages\n$core_utils" | fzf)
if [ -z "$selected" ]; then
	exit 1
fi
read -p "Query: " query
file="$local_copy""$selected"-"$query"
if echo "$languages" | grep -qs "$selected"; then
	curl -s cht.sh/"$selected"/"$query"> "$file"-new
else
	curl -s cht.sh/"$selected"~"$query"> "$file"-new
fi
if [ -z $(cat "$file"-new) ]; then
	rm "$file"-new
	if [ ! -f "$file" ]; then
		exit 1
	fi
else
	rm "$file"
	mv "$file"-new "$file"
fi
bat "$file" --paging=always --plain
