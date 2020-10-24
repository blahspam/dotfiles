#! /usr/bin/env zsh

# antibody
[[ -f "${HOME}/.zsh/plugins.zsh" ]] || antibody bundle <"${HOME}/.zsh/plugins.txt" >"${HOME}/.zsh/plugins.zsh"
source "${HOME}/.zsh/plugins.zsh"

# everything else
for file in aliases colors completions history prompt; do
  source "${HOME}/.zsh/$file.zsh"
  [[ -f "${HOME}/.zsh-private/$file.zsh" ]] && source "${HOME}/.zsh-private/$file.zsh"
done

# key bindings
bindkey -e

[[ -f "/usr/local/opt/fzf/shell/key-bindings" ]] && source "/usr/local/opt/fzf/shell/key-bindings"
