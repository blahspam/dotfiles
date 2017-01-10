# completion
autoload -U compinit && compinit

# prompt
[[ -f ~/.zsh/prompt ]] && source ~/.zsh/prompt

# functions
[[ -f ~/.zsh/functions ]] && source ~/.zsh/functions

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# colors
autoload -U colors && colors
eval `dircolors ~/.dircolors`

# bash style words
autoload -U select-word-style && select-word-style bash

# emacs keybindings
bindkey -e

# history
setopt INC_APPEND_HISTORY HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS HIST_REDUCE_BLANKS
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=999999999

# local overrides
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
