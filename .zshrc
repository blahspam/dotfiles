# completion
autoload -U compinit && compinit

source ~/.zsh/prompt
source ~/.zsh/functions

# kubectl auto completion
source <(kubectl completion zsh)

# colors
source ~/.base16-shell/base16-shell.plugin.zsh
base16_solarflare
autoload -U colors && colors
eval `dircolors ~/.dircolors`

# bash style words
autoload -U select-word-style && select-word-style bash

# emacs keybindings
bindkey -e

# history
setopt INC_APPEND_HISTORY HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS HIST_REDUCE_BLANKS
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=999999999

# move around
alias ..="cd .."
alias ...="cd ../.."
alias cdd="cd -"

alias ls="ls -F --color=auto --quoting=literal"
alias l="ls -lAh"
alias ll="ls -l"
alias la='ls -A'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# quick edits
alias hosts='sudo vim /etc/hosts'
alias dots='vim $DOTFILES'

# quick servers
alias http="python -m SimpleHTTPServer"
alias smtp="python -m smtpd -n -c DebuggingServer localhost:25"

# docker
alias dk="docker"
alias dkc="docker-compose"
# docker: delete all stopped containers
alias dkrm="docker rm \$(docker ps -a -q)"
# docker: delete untagged images
alias dkrmi="docker rmi -f \$(docker images -q -a -f dangling=true)"
# docker: delete all images
alias dkclean="docker rmi -f \$(docker images -q)"

# kube
alias kb="kubectl"
alias kbp="kubectl get pods -o=wide"
alias kbs="kubectl get services -o=wide"

# local overrides
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
