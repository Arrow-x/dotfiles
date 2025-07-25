#!/bin/bash
SHELL=/bin/bash
opener="nsxiv"

find $HOME/gallery-dl/nhentai/ $HOME/gallery-dl/exhentai/ -mindepth 1 -type d -printf "%T+ %p\n" | sort -r | cut -d' ' -f2- | fzf \
	--preview='draw_thumb {} $FZF_PREVIEW_COLUMNS $FZF_PREVIEW_LINES' \
	--bind "ctrl-l:execute: setsid -f $opener {}>/dev/null" \
	--bind "ctrl-d:reload(gio trash {} && find_hentai)" \
	--header "CTRL-l to open without closing | CTRL-d to delete"
