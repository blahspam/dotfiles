#! /usr/bin/env zsh


export HISTFILE=${HOME}/.zsh/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTTIMEFORMAT="[%F %T] "

setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
# setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
# setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

# zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
