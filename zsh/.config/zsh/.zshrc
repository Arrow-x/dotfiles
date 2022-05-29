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

# zsh Colors and theri plugins {{{

zle_highlight=('paste:none')
. /usr/share/LS_COLORS/dircolors.sh

autoload -Uz colors && colors
# }}}

# zstyle ':znap:*' repos-dir # Costum Folder for repos

# Downloading and Initialazing the plugin manager {{{
# Download Znap, if it's not there yet.
[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

source ~/Git/zsh-snap/znap.zsh  # Start Znap
#  }}}

# Completion Menu Options {{{
zstyle ':autocomplete:*' widget-style menu-complete
#}}}

# Making the cursor a beam in normal mode and a line in insert mode {{{
bindkey -v
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
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
znap prompt sindresorhus/pure
#  }}}

# Sourcing aliases file {{{
source $HOME/.config/zsh/zsh-aliases
#  }}}

# Install Plugins {{{
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source zsh-users/zsh-completions
znap source hlissner/zsh-autopair
#  }}}

# Vi mode keybids {{{
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^P' vi-up-line-or-history
bindkey -M menuselect '^N' vi-down-line-or-history

bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-select
#  }}}

# `znap eval` caches and runs any kind of command output for you.
# znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'

# `znap function` lets you lazy-load features you don't always need.
# znap function _pyenv pyenvn 'eval "$( pyenv init - --no-rehash )"'
# compctl -K    _pyenv pyenv
