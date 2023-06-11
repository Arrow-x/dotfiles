#!/bin/sh
case "$TERM" in
	foot) ueberzugpp cmd -s "$UB_SOCKET" -a remove -i PREVIEW -d true ;;
	*) ueberzugpp cmd -s "$UB_SOCKET" -a remove -i PREVIEW ;;
esac
