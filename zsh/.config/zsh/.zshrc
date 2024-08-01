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
znap source jeffreytse/zsh-vi-mode

source /usr/share/fzf-tab-completion/zsh/fzf-zsh-completion.sh
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
#  }}}

# Completion Menu Options {{{
zstyle ':completion:*' fzf-search-display true
# basic file preview for ls (you can replace with something more sophisticated than head)
zstyle ':completion::*:ls::*' fzf-completion-opts --preview='eval head {1}'

# preview when completing env vars (note: only works for exported variables)
# eval twice, first to unescape the string, second to expand the $variable
zstyle ':completion::*:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-completion-opts --preview='eval eval which {1}'

# preview a `git status` when completing git add
zstyle ':completion::*:git::git,add,*' fzf-completion-opts --preview='git -c color.status=always status --short'

# if other subcommand to git is given, show a git diff or git log
zstyle ':completion::*:git::*,[a-z]*' fzf-completion-opts --preview='
eval set -- {+1}
for arg in "$@"; do
    { git diff --color=always -- "$arg" | git log --color=always "$arg" } 2>/dev/null
done'
#}}}

# Vi supported keymaps {{{
function zvm_after_init() {
  zvm_bindkey viins '^N' fzf_completion
  # zvm_bindkey viins '^N' menu-select
  zvm_bindkey viins '^P' _atuin_search_widget
  znap source hlissner/zsh-autopair
}
#}}}
