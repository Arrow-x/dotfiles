export EDITOR=/usr/bin/nvim
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# zsh config dir
export ZDOTDIR=$HOME/.config/zsh

# Turn Off the Beebs
xset b off

#swith the escape and caps
setxkbmap -option caps:swapescape

#Start redshift
redshift

#check for bing picture of the day and set it
python ~/Hossam/Projects/Scripts/XFCE4-auto-Bing-wallpapers/changer.py
