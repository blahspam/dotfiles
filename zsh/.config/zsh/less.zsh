#! /usr/bin/env zsh

# Improved less defaults
export LESS='--quit-if-one-screen --ignore-case --no-init --RAW-CONTROL-CHARS --tabs=2'
export LESSKEY=""$XDG_CONFIG_HOME"/less/lesskey"
export LESSHISTFILE=""$XDG_CACHE_HOME"/less/history"
export PAGER=less

# Colorful less.
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'
export LESS_TERMCAP_ue=$'\E[0m'
