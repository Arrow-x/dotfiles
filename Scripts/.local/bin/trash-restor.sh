#!/bin/sh
trash_list="$(gio trash --list)"

if [ -z "$trash_list" ]; then
	echo "Trash is Empty"
	exit
fi

selection="$(echo "$trash_list" | cut -f2 | fzf -i -e -m \
	--bind 'home:first,end:last,ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all' \
	--header "ctrl-a: select all, ctrl-d: deselect-all, ctrl-t: toggle selection" \
	--prompt="gio trash restore file(s): ")"

[ -z "$selection" ] && exit

restorer() {
	while read -r line; do
		gio trash --restore "$line"
		error=$?
		if [ "$error" -ne 0 ]; then
			printf "Error code %s: Couldn't restore %s\n" "$line" "$error"
			continue
		fi

		proper_name="$(echo "$trash_list" | grep "$line" | cut -f2)"
		printf "restored: %s\n" "$proper_name"

	done
}

echo "$trash_list" | grep "$selection" | cut -f1 | restorer
