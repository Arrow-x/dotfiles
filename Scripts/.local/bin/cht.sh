#!/bin/sh
languages=$(echo "bash sh golang rust lua cpp c csharp python" | tr ' ' '\n')
core_utils=$(echo "xargs curl jq find mv sed awk" | tr ' ' '\n')

selected=$(printf "$languages\n$core_utils" | fzf)
if [ -z "$selected" ]; then
	exit 128
fi
read -p "Query: " query

if echo "$languages" | grep -qs "$selected"; then
	curl -s cht.sh/"$selected"/"$query" | bat --paging=always --plain
else
	curl -s cht.sh/"$selected"~"$query" | bat --paging=always --plain
fi
