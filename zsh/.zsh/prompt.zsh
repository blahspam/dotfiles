#! /usr/bin/env zsh

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{green}+%f'
zstyle ':vcs_info:*' unstagedstr '%F{red}!%f'
zstyle ':vcs_info:*' formats ' (%F{blue}%b%f%c%u%m)'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-status git-remote

precmd() {
  vcs_info
}

function +vi-git-untracked() {
  [[ -n $(git ls-files --others --exclude-standard) ]] && hook_com[staged]+="%F{orange}?%f"
}

function +vi-git-remote() {
  local remote=$(git rev-parse --verify ${hook_com[branch]}@{upstream} --abbrev-ref 2>/dev/null)
  [[ -n ${remote} ]] && hook_com[branch]=${remote}
}

function +vi-git-status() {
  local st=$(git rev-list --left-right --count HEAD...@{upstream} 2>/dev/null)
  ((${st[0]})) && hook_com[misc]+=" %F{red}↓${st[0]}%f"
  ((${st[1]})) && hook_com[misc]+=" %F{green}↑${st[1]}%f"
}

setopt prompt_subst
PROMPT='%F{green}%M%f:%F{white}%2c%f${vcs_info_msg_0_} %F{yellow}$%f '
