#!/usr/bin/env zsh
#Credit: https://github.com/ThePrimeagen
pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "Removing $folder"
    stow -D $folder
done
popd
