#! /usr/bin/env zsh

# ignore run commands in /etc
setopt no_global_rcs

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

# go: env specific
if [[ -d /usr/local/opt/go/libexec/ ]]; then
  export GOROOT=/usr/local/opt/go/libexec/
fi

# fzf settings
if [[ $+commands[fzf] ]]; then

fi

# local overrides
[[ -f ${HOME}/.zshenv.local ]] && source ${HOME}/.zshenv.local
