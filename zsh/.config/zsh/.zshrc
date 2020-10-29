#! /usr/bin/env zsh

bindkey -e

# additional vars
export DOTFILES=${HOME}/.dotfiles
export EDITOR=nvim

# antibody plugins
if [[ ! -f ${ZDOTDIR}/plugins.zsh ]] || [[ ! -d $(antibody home) ]]; then
  antibody bundle <${ZDOTDIR}/plugins >${ZDOTDIR}/plugins.zsh
fi
source ${ZDOTDIR}/plugins.zsh

# everything else
typeset -U config_files=(${ZDOTDIR}/*.zsh)
for file in ${config_files}; do
  source $file
done

# load private/local overrides
[[ -f ${ZDOTDIR}/private.zsh ]] && source ${ZDOTDIR}/private.zsh
[[ -f ${ZDOTDIR}/local.zsh ]] && source ${ZDOTDIR}/local.zsh