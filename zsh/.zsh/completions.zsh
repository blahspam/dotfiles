#! /usr/bin/env zsh

# completions
autoload -Uz compinit
if [[ -n ${HOME}/.zsh/zcompdump(#qN.mh+24) ]]; then
	compinit -i -d ${HOME}/.zsh/.zcompdump
else
	compinit -C ${HOME}/.zsh/.zcompdump
fi;

# completion style: (h/t @mnarrell)
# - Case-insensitive.
# - Accept abbreviations after . or _ or - (ie. f.b -> foo.bar).
# - Substring complete (ie. bar -> foobar).
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# additional completions.

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
