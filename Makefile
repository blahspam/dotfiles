# use bash for brace expansions
SHELL := bash

# set default xdg dirs if not set
XDG_CONFIG_HOME ?= $(HOME)/.config
XDG_CACHE_HOME ?= $(HOME)/.cache
XDG_DATA_HOME ?= $(HOME)/.local/share

# simple stowable modules
modules :=  git npm pg tig
uname := $(shell uname)

# run everything
all: pkgs nvim zsh $(modules)

# initialize dirs if necessary
init-dirs:
	@mkdir -pv "$(HOME)/Develop"
	@mkdir -pv "$(XDG_CONFIG_HOME)"
	@mkdir -pv "$(XDG_CACHE_HOME)"
	@mkdir -pv "$(XDG_DATA_HOME)"


ifeq ($(uname), Darwin) 
# Macos: manage packages with brew
pkgs: 
	@command -v brew > /dev/null 2>&1 || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	@brew tap Homebrew/bundle
	@brew update
	@brew bundle --no-lock --cleanup --file="./packages/Brewfile" 
brew: pkgs
else ifeq ($(uname), Linux)
# Linux: manage packages with apt 
pkgs: 
	@./packages/apt.sh
apt: pkgs
endif

# stow neovim & install plugins
nvim: init-dirs
	@mkdir -pv "$(XDG_CACHE_HOME)/nvim"
	@mkdir -pv "$(XDG_DATA_HOME)/nvim/"{backup,swap,undo}
	@stow -v --target=${HOME} nvim
	@nvim +PlugInstall +qall!

# stow zsh
zsh: init-dirs
	@mkdir -pv "$(XDG_CACHE_HOME)/"{zsh,less}
	@mkdir -pv "$(XDG_DATA_HOME)/"{zsh,less}
	@stow --v --target=${HOME} zsh
	@git submodule update --init --recursive -q

# stow "simple" modules
$(modules): init-dirs
	@mkdir -pv "$(XDG_DATA_HOME)/$@"
	@mkdir -pv "$(XDG_CACHE_HOME)/$@"
	@stow --v --target=${HOME} $@



.PHONY: all pkgs nvim zsh $(modules)
