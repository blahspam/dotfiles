#! /usr/bin/env zsh

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

fpath+=(${HOME}/.zsh/functions.zsh)
