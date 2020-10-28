#! /usr/bin/env zsh

# completions
autoload -Uz compinit
if [[ -n ${HOME}/.zsh/zcompdump(#qN.mh+24) ]]; then
	compinit -i -d ${HOME}/.zsh/.zcompdump
else
	compinit -C ${HOME}/.zsh/.zcompdump
fi;

# antibody
source <(command antibody init)

# fzf
[[ -d "/usr/local/opt/fzf/shell" ]] &&
  source "/usr/local/opt/fzf/shell/completion.zsh"

# helm (lazy)
if [[ $+commands[helm] ]]; then
  function helm() {
    unset -f helm #
    source <(command helm completion zsh)
    command helm "$@"
  }
fi

# kubectl (lazy)
if [[ $+commands[kubectl] ]]; then
  function kubectl() {
    unset -f kubectl
    source <(command kubectl completion zsh)
    command kubectl "$@"
  }
fi

# zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept 
