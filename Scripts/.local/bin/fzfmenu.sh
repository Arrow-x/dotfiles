#!/bin/sh

if pidof -o %PPID -x "fzfmenu.sh" >/dev/null; then
	exit
fi

footclient -a t_fzf_menu sh -c "fzf $* </proc/$$/fd/0 >/proc/$$/fd/1"
