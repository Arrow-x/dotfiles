#!/bin/sh

killall swhks

swhks &
pkexec swhkd
