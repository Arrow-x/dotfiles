#!/bin/sh
case "$TERM" in
	foot | xterm-256color | tmux-256color) ueberzugpp cmd -s "$UB_SOCKET" -a remove -i PREVIEW -d true ;;
	*) ueberzugpp cmd -s "$UB_SOCKET" -a remove -i PREVIEW ;;
esac
