#! /usr/bin/env zsh

# compile completions daily
autoload -Uz compinit
if [[ -n "${HOME}/.zsh/zcompdump(#qN.mh+24)" ]]; then
  compinit -i -d "${HOME}/.zsh/zcompdump"
else
  compinit -C "${HOME}/.zsh/zcompdump"
fi

# fzf
[[ -d "/usr/local/opt/fzf/shell" ]] &&
  source "/usr/local/opt/fzf/shell/completion.zsh" &&
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-messages --no-ignore-vcs'

# extra completions
source <(command antibody init)

if [[ $+commands[helm] ]]; then
  function helm() {
    unset -f helm #
    source <(command helm completion zsh)
    command helm "$@"
  }
fi

if [[ $+commands[kubectl] ]]; then
  function kubectl() {
    unset -f kubectl
    source <(command kubectl completion zsh)
    command kubectl "$@"
  }
fi

# zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept
