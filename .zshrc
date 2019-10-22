setopt no_global_rcs

# antibody
source ~/.zsh_plugins.sh

# prompt
source ~/.zsh/prompt

# functions
source ~/.zsh/functions.sh

# completions
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi
fpath=(~/.zsh/completions $fpath)

if [ $commands[helm] ]; then
  function helm() {
    source <(command helm completion zsh)
    command helm "$@"
  }
fi

if [ $commands[kubectl] ]; then
  function kubectl() {
    source <(command kubectl completion zsh)
    command kubectl "$@"
  }
fi


# colors
source ~/.base16-shell/base16-shell.plugin.zsh
base16_solarflare
autoload -U colors && colors
eval `dircolors ~/.dircolors`

# bash style words
autoload -U select-word-style && select-word-style bash

# emacs keybindings
bindkey -e

# autosuggest
bindkey '^ ' autosuggest-accept

# history
setopt INC_APPEND_HISTORY HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS HIST_REDUCE_BLANKS
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=999999999

# aliases
# nav
alias ..="cd .."
alias ...="cd ../.."
alias cdd="cd -"

# better defaults
alias ls="ls -AF --color=auto --quoting=literal"
alias l="ls -l"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# quick edits
alias hosts='sudo vim /etc/hosts'
alias dots='vim $DOTFILES'

# docker
alias dk='docker'
alias dkc='docker-compose'
alias dki='dk images -f "dangling=false"'
alias dkp='dk system prune -f'
alias dkr='dk run IMAGES'
alias dkrmi='dk rmi -f $(docker images -q -a -f dangling=true)'

alias -g IMAGES='$(dki | fzf --height=8 --header-lines=1 --reverse | awk "{print \$1 \":\" \$2}")'

# kube
alias kb="kubectl"
alias kbc="kb config use-context CTX"
alias kbe="kb exec -it POD sh"
alias kbl="kb logs -f POD"
alias kbp="kb get pods -o=wide"
alias kbdp="kb describe pod POD"
alias kbs="kb get services -o=wide"
alias kbds="kb describe service SVC"

alias -g CTX='$(kb config get-contexts -o=name | sed "s/\($(kb config view -o=jsonpath='{.current-context}')$\)/*\1/" | sort -fs | fzf --height=8 --reverse)'
alias -g POD='$(kbp | fzf --height=8 --header-lines=1 --reverse | awk "{print \$1}")'
alias -g SVC='$(kbs | fzf --height=8 --header-lines=1 --reverse | awk "{print \$1}")'

# create node_modules link (because dropbox)
alias mknm='rm -rf ./node_modules && ln -s $(mktemp -d -t node_modules.XXXX) ./node_modules'

# local overrides
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
