#! /usr/bin/env zsh

# ignore run commands in /etc
setopt no_global_rcs

# XDG directories
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share

# aws: xdg config
export AWS_SHARED_CREDENTIALS_FILE="${XDG_CONFIG_HOME}/aws/credentials"
export AWS_CONFIG_FILE="${XDG_CONFIG_HOME}/aws/config"

# docker: xdg config
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"

# homebrew: bundle --no-lock
export HOMEBREW_BUNDLE_NO_LOCK=true

# npm: xdg config
export NPM_CONFIG_USERCONFIG=${XDG_CONFIG_HOME}/npm/config
export NPM_CONFIG_DEVDIR=${XDG_CACHE_HOME}/npm

# postgres: xdg config
export PSQLRC="${XDG_CONFIG_HOME}/pg/psqlrc"
export PGPASSFILE="${XDG_CONFIG_HOME}/pg/pgpass"
# export PGSERVICEFILE="${XDG_CONFIG_HOME}/pg/pg_service.conf"
export PSQL_HISTORY="${XDG_DATA_HOME}/pg/history"

# zsh: xdg config
export ZDOTDIR=${XDG_CONFIG_HOME}/zsh

# path
typeset -U path
path=${HOME}/bin
for f in \
  /usr/local/opt/coreutils/libexec/gnubin \
  /usr/local/opt/gnu-tar/libexec/gnubin \
  /usr/local/opt/make/libexec/gnubin \
  /usr/local/opt/go/bin \
  /Library/TeX/Distributions/Programs/texbin; do
  [[ -d ${f} ]] && path+=(${f})
done
path+=(/usr/local/bin)
path+=(/usr/local/sbin)
path+=(/usr/bin)
path+=(/usr/sbin)
path+=(/bin)
path+=(/sbin)
