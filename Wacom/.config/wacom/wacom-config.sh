#!/bin/sh

for i in $(seq 10); do
    if xsetwacom list devices | grep -q Wacom; then
        break
		echo "Break"
    fi
    sleep 1
	echo "Sleep 1"
done

list=$(xsetwacom list devices)
pad=$(echo "${list}" | awk '/pad/{print $9}')
stylus=$(echo "${list}" | xsetwacom list devices | awk '/stylus/{print $9}')

xsetwacom set "${stylus}" area 0 0 21600 12150
