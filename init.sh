#!/bin/sh

systemctl --user enable --now pipewire
systemctl --user enable --now pipewire-pulse.service
systemctl enable --now keyd
systemctl enable --now cronie
systemctl enable ly.service
