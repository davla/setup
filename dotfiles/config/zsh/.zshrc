#!/usr/bin/env zsh

# This script initializes zsh

########################################
# Loading interactive setup
########################################

source "$ZDOTDIR/interactive/init.zsh"

#######################################
# Misc
#######################################

# Set up the prompt

#autoload -Uz promptinit
#promptinit

setopt nomultios

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE="$ZDOTDIR/.zsh_history"

# Use modern completion system
#autoload -Uz compinit bashcompinit
#compinit
#bashcompinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)EXA_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
