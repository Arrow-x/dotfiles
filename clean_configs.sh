#!/bin/sh
dirs="$(find $HOME/dotfiles -maxdepth 1 -mindepth 1 -type d -not -path "*/.git*")"
for dir in $dirs; do
	echo "Removing $dir"
	stow -D "$(echo "$dir" | awk -F "/" '{print $5}')"
done
