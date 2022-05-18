export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

export DOTFILES=$HOME/dotfiles

export ZDOTDIR=$HOME/.config/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/.zsh_history
# export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
# export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
# export XPROFILE="$XDG_CONFIG_HOME"/X11/xprofile
export GOPATH="$XDG_DATA_HOME"/go
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GEM_PATH="$XDG_DATA_HOME/ruby/gems"
export GEM_SPEC_CACHE="$XDG_DATA_HOME/ruby/specs"
export GEM_HOME="$XDG_DATA_HOME/ruby/gems"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"

# Disable files
export LESSHISTFILE=-

# Default Apps
export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export VIDEO="mpv"
export IMAGE="nsxiv"
export COLORTERM="truecolor"
export OPENER="mimeo"
export PAGER="bat"
# export WM="bspwm"

# Path
export PATH="/usr/local/opt/openjdk/bin:$PATH"
# path=("$HOME/scripts" "$HOME/scripts/alsa" "$HOME/scripts/dragon" "$HOME/scripts/lf" "$HOME/scripts/i3" "$HOME/scripts/pulse"
# 	"$HOME/scripts/polybar" "$HOME/scripts/bspwm" "$HOME/scripts/lemonbar" "$HOME/scripts/transmission"
# 	"$HOME/bin/tweetdeck-linux-x64" "$XDG_DATA_HOME/ruby/gems/bin" "$HOME/go/bin" "$HOME/.local/share/cargo/bin"
# 	"$XDG_DATA_HOME/npm/bin" "$HOME/.local/bin" "$path[@]")
# export PATH
