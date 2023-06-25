#!/bin/zsh
# vim:fileencoding=utf-8:foldmethod=marker

# zsh Histroy Options {{{
HISTFILE=~/.local/share/zsh/.zsh_history
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
SAVEHIST=1000
HISTSIZE=999
#  }}}

# General shell Options {{{
stty stop undef		# Disable ctrl-s to freeze terminal.
#}}}

# zsh Colors and thier plugins {{{
zle_highlight=('paste:none')
# . /usr/share/LS_COLORS/dircolors.sh

autoload -Uz colors && colors
# }}}

# Downloading and Initialazing the plugin manager {{{
# Download Znap, if it's not there yet.

# zstyle ':znap:*'

# repos-dir # Costum Folder for repos
zsh_plugs="$XDG_DATA_HOME/zsh/Plugins"
[[ -f $zsh_plugs/zsh-snap/znap.zsh ]] ||
git clone --depth 1 -- \
	https://github.com/marlonrichert/zsh-snap.git $zsh_plugs/zsh-snap

source $zsh_plugs/zsh-snap/znap.zsh  # Start Znap
#  }}}

# Completion Menu Options {{{
zstyle ':autocomplete:*' widget-style menu-select

# Override history menu.
zstyle ':autocomplete:history-search-backward:*' list-lines 20

# Override history search.
zstyle ':autocomplete:history-incremental-search-backward:*' list-lines 20

bindkey -M menuselect '\r' .accept-line
#}}}

# Making the cursor a beam in normal mode and a line in insert mode {{{
bindkey -v
zle-keymap-select() {
	case $KEYMAP in
		vicmd) echo -ne '\e[1 q' ;;      # block
		viins|main) echo -ne '\e[5 q' ;; # beam
	esac
}
zle -N zle-keymap-select
zle-line-init() {
	zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
	echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
#  }}}

# Initialazing the prmompt {{{
znap prompt ivan-volnov/pure
#  }}}

# Sourcing aliases file {{{
source $HOME/.config/zsh/zsh-aliases
#  }}}

# Install Plugins {{{

# znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source zsh-users/zsh-completions
znap source hlissner/zsh-autopair

# source /usr/share/fzf/completion.zsh
# source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf-tab-completion/zsh/fzf-zsh-completion.sh
eval "$(atuin init zsh)"
# source /usr/share/fzf-tab-completion/zsh/fzf-zsh-completion.sh
# bindkey '^I' fzf_completion
#  }}}
zstyle ':completion:*' fzf-search-display true
# basic file preview for ls (you can replace with something more sophisticated than head)
zstyle ':completion::*:ls::*' fzf-completion-opts --preview='eval head {1}'

# preview when completing env vars (note: only works for exported variables)
# eval twice, first to unescape the string, second to expand the $variable
zstyle ':completion::*:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-completion-opts --preview='eval eval echo {1}'

# preview a `git status` when completing git add
zstyle ':completion::*:git::git,add,*' fzf-completion-opts --preview='git -c color.status=always status --short'

# if other subcommand to git is given, show a git diff or git log
zstyle ':completion::*:git::*,[a-z]*' fzf-completion-opts --preview='
eval set -- {+1}
for arg in "$@"; do
    { git diff --color=always -- "$arg" | git log --color=always "$arg" } 2>/dev/null
done'

# Vi mode keybids {{{
# bindkey -M menuselect '^h' vi-backward-char
# bindkey -M menuselect '^l' vi-forward-char
# bindkey -M menuselect '^P' vi-up-line-or-history
# bindkey -M menuselect '^N' vi-down-line-or-history
# bindkey -M menuselect '^k' vi-up-line-or-history
# bindkey -M menuselect '^j' vi-down-line-or-history
bindkey '^I' fzf_completion
bindkey '^P' _atuin_search_widget
# bindkey '^N' down-line-or-select
#  }}}

# `znap eval` caches and runs any kind of command output for you.
# znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'

# `znap function` lets you lazy-load features you don't always need.
# znap function _pyenv pyenvn 'eval "$( pyenv init - --no-rehash )"'
# compctl -K    _pyenv pyenv
