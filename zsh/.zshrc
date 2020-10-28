#! /usr/bin/env zsh

bindkey -e

# plugins
if [[ ! -f ${HOME}/.zsh/plugins.zsh ]] || [[ ! -d $(antibody home) ]]; then
  antibody bundle <${HOME}/.zsh/plugins >${HOME}/.zsh/plugins.zsh
fi
source ${HOME}/.zsh/plugins.zsh

# everything else
for file in aliases.zsh colors.zsh completions.zsh history.zsh prompt.zsh; do
  source ${HOME}/.zsh/$file
done

# private/local overrides
[[ -f ${HOME}/.zshrc.private ]] && source ${HOME}/.zshrc.private
[[ -f ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local
