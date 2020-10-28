#! /usr/bin/env zsh

# use named colors
autoload -Uz colors && colors

# base16 for teh sex
BASE16_SHELL=${HOME}/.zsh/base16-shell
[[ -n "${PS1}" ]] &&
  [[ -f "${BASE16_SHELL}/profile_helper.sh" ]] &&
  eval "$("${BASE16_SHELL}/profile_helper.sh")"
base16_solarflare 2>/dev/null

# generate LS_COLORS via GNU dircolors
eval "$(dircolors ${HOME}/.zsh/dircolors)"
