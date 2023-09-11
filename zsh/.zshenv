# vim: filetype=zsh
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}


export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/.zsh_history
export GOPATH="$XDG_DATA_HOME"/go
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GEM_PATH="$XDG_DATA_HOME/ruby/gems"
export GEM_SPEC_CACHE="$XDG_DATA_HOME/ruby/specs"
export GEM_HOME="$XDG_DATA_HOME/ruby/gems"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export NUGET_PACKAGES="$XDG_DATA_HOME"/NuGetPackages
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
export WORKON_HOME="$XDG_DATA_HOME/virtualenvs"
export DOTFILES=$HOME/dotfiles
export XCURSOR_SIZE=24
export LS_COLORS="$(vivid generate tokyonight)"
export QT_QPA_PLATFORMTHEME=qt6ct

export BEMENU_OPTS="--accept-single --fn FiraCode Nerd Font 12 -n \
	--tb '#565f89' \
	--tf '#cfc9c2' \
	--fb '#24283b' \
	--ff '#cfc9c2' \
	--nb '#24283b' \
	--nf '#cfc9c2' \
	--ab '#1a1b26' \
	--af '#cfc9c2' \
	--hb '#565a6e' \
	--hf '#ff9e64' \
	--sb '#565a6e' \
	--sf '#ff9e64' \
	--scb '#24283b' \
	--scf '#f7768e'"
export FZF_COMPLETION_OPTS="--multi"
# Default Apps
export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export TERMINAL="st"
export BROWSER="firejail firefox"
export VIDEO="mpv"
export IMAGE="nsxiv"
export COLORTERM="truecolor"
export OPENER="mimeopen"
export MANPAGER="sh -c 'sed -e s/.\\\\x08//g | bat -l man -p'"
export MENU="dmenu -n"
export FMENU="rofi"

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
	export XDG_CURRENT_DESKTOP="sway"
	export MOZ_ENABLE_WAYLAND=1
	export QT_QPA_PLATFORM="wayland"
	export MENU="bemenu"
	export FMENU="wofi"
	export TERMINAL="footclient"
fi

# Path
typeset -U path PATH
path=(
	# "$XDG_DATA_HOME/ruby/gems/bin"
	"$HOME/go/bin"
	"$HOME/.local/share/cargo/bin"
	"$XDG_DATA_HOME/npm/bin"
	"$HOME/.local/bin"
	"$path[@]"
"/usr/local/opt/openjdk/bin:$PATH")

export PATH
