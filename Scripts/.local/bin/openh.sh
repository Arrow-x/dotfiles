#!/bin/bash
SHELL=/bin/bash
opener="nsxiv"

find_hentai() {
	DOJ=$(find ~/File/Homework/H-Manga/Doujinshi/ -mindepth 1 -type d -printf "%T+ %p\n")
	PAR=$(find ~/File/Homework/H-Manga/Parody/ -mindepth 2 -type d -printf "%T+ %p\n")
	TAN=$(find ~/File/Homework/H-Manga/Tankebons/ -mindepth 1 -type d -printf "%T+ %p\n")
	list=""
	[ -n "$DOJ" ] && list="$(printf "%s\n" "$DOJ")"
	[ -n "$PAR" ] && list="$(printf "%s\n%s" "$list" "$PAR")"
	[ -n "$TAN" ] && list="$(printf "%s\n%s" "$list" "$TAN")"
	printf "%s" "$list" | sort -r | sed "s#.*/home#/home#"
}
export -f find_hentai

find_hentai | fzf \
	--preview='draw_thumb {} $FZF_PREVIEW_COLUMNS $FZF_PREVIEW_LINES' \
	--bind "ctrl-l:execute: setsid -f $opener {}>/dev/null" \
	--bind "ctrl-d:reload(gio trash {} && find_hentai)" \
	--header "CTRL-l to open without closing | CTRL-d to delete"
