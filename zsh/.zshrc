#!/bin/zsh

HISTFILE=~/.cache/zsh/history
HISTSIZE=100000
SAVEHIST=100000

setopt autocd nomatch INC_APPEND_HISTORY HIST_IGNORE_ALL_DUPS
unsetopt beep extendedglob notify

autoload -U colors && colors

bindkey -v
export KEYTIMEOUT=1

fpath=($ZDOTDIR $fpath)
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'
zmodload zsh/complist
DISABLE_UPDATE_PROMPT=true
compinit -d ~/.cache/zsh/zcompdump
_comp_options+=(globdots)
zstyle ':completion:*' list-colors
eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

function zle-keymap-select () {
  case $KEYMAP in
    vicmd) echo -ne '\e[1 q';;
    viins|main) echo -ne '\e[5 q';;
  esac
}
zle -N zle-keymap-select
zle-line-init() {
  zle -K viins
  echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

bindkey '^[[Z' reverse-menu-complete
bindkey -M menuselect '\e' send-break
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey "^?" backward-delete-char

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#838996'

source ~/.local/bin/zsh/zsh-autosuggestions
source ~/.local/bin/zsh/zsh-autopair
source "$ZDOTDIR/.aliases"
source "$ZDOTDIR/.zshenv"
source ~/.local/bin/zsh/zsh-system-clipboard
source ~/.local/bin/zsh/zsh-syntax-highlighting
source ~/.local/bin/zsh/zsh-history-substring-search

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
