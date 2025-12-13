#!/bin/sh
#TODO: put the install packages command here too, first the package manager then the packages on the official repos then the AUR packages

#TODO: install /etc/ configs too here

#TODO: at least install ly, keyd and opentabletdriver

systemctl enable ly@tty1.service

systemctl enable --now keyd
systemctl enable --now cronie

systemctl --user enable --now pipewire
systemctl --user enable --now pipewire-pulse.service
systemctl --user enable --now opentabletdriver
