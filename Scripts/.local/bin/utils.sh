#!/bin/sh

check_dep() {
	if ! command -v "$1" >/dev/null 2>&1; then
		printf "Error: %s is required but not installed.\n" "$1" >&2
		exit 1
	fi
}
