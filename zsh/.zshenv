#! /usr/bin/env zsh

# ignore run commands in /etc
setopt no_global_rcs

# XDG (todo)
# export XDG_CONFIG_HOME=${HOME}/.config
# export XDG_CACHE_HOME=${HOME}/.cache
# export XDG_DATA_HOME=${HOME}/.local/share
# export XDG_RUNTIME_DIR=${HOME}/tmp/runtime

# export ZDOTDIR=${XDG_CONFIG_HOME}/zsh

export DOTFILES=${HOME}/.dotfiles
export EDITOR=vim

# path
typeset -U path
path=${HOME}/bin
for f in \
  /usr/local/opt/coreutils/libexec/gnubin \
  /usr/local/opt/gnu-tar/libexec/gnubin \
  /usr/local/opt/make/libexec/gnubin \
  /usr/local/opt/go/bin \
  /Library/TeX/Distributions/Programs/texbin; do
  [[ -d ${f} ]] && path+=(${f})
done
path+=(/usr/local/bin)
path+=(/usr/local/sbin)
path+=(/usr/bin)
path+=(/usr/sbin)
path+=(/bin)
path+=(/sbin)

# overrides
[[ -f ${HOME}/.zshenv.private ]] && source ${HOME}/.zshenv.private
[[ -f ${HOME}/.zshenv.local ]] && source ${HOME}/.zshenv.local
