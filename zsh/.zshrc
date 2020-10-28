#! /usr/bin/env zsh

# antibody
if [[ ! -f "${HOME}/.zsh/plugins.zsh" ]] || [[ ! -d $(antibody home) ]]; then
  antibody bundle <"${HOME}/.zsh/plugins" >"${HOME}/.zsh/plugins.zsh"
fi
source "${HOME}/.zsh/plugins.zsh"

# base-16
autoload -Uz colors && colors
BASE16_SHELL=${HOME}/.zsh/base16-shell
[[ -n ${PS1} ]] &&
  [[ -f ${BASE16_SHELL}/profile_helper.sh ]] &&
  eval "$(${BASE16_SHELL}/profile_helper.sh)"
base16_solarflare 2>/dev/null
eval "$(dircolors ${HOME}/.zsh/dircolors)"

# everything else
for file in aliases completions history prompt; do
  source "${HOME}/.zsh/$file.zsh"
  [[ -f "${HOME}/.zsh-private/$file.zsh" ]] && source "${HOME}/.zsh-private/$file.zsh"
done

# key bindings
bindkey -e

# [[ -f "/usr/local/opt/fzf/shell/key-bindings" ]] && source "/usr/local/opt/fzf/shell/key-bindings"
