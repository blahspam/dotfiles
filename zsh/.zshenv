#! /usr/bin/env zsh

# ignore run commands in /etc
setopt no_global_rcs

# configure path & env for all shells
for file in path env; do
  source "${HOME}/.zsh/$file.zsh"
  [[ -f "${HOME}/.zsh-private/$file.zsh" ]] && source "${HOME}/.zsh-private/$file.zsh"
done
