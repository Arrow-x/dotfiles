#!/bin/sh
languaages=$(echo "bash sh golang rust lua cpp c csharp python" | tr ' ' '\n')
core_utils=$(echo "xargs curl jq find mv sed awk" | tr ' ' '\n')

selected=$(printf "$languaages\n$core_utils" | fzf)
read -p "query: " query

if echo $languaages | grep -qs $selected; then
	tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
	tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
