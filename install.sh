#!/bin/sh
stow ./*
systemctl --user enable hotkeys.service
